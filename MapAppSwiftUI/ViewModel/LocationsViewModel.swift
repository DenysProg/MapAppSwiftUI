//
//  LocationsViewModel.swift
//  MapAppSwiftUI
//
//  Created by Denys Nikolaichuk on 08.03.2023.
//

import SwiftUI
import Foundation
import MapKit

final class LocationsViewModel: ObservableObject {
    @Published var locations: [Location]?
    @Published var mapLocation: Location? {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    @Published var showLocationsList: Bool = false
    
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    init() {
        getLocations()
    }
    
    private func getLocations() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first
        updateMapRegion(location: locations.first)
    }
    
    private func updateMapRegion(location: Location?) {
        withAnimation(.easeInOut) {
            if let location = location {
                mapRegion = MKCoordinateRegion(center: location.coordinates, span: mapSpan)
            }
        }
    }
    
    func toggleLocationsList() {
        withAnimation(.easeInOut) {
            showLocationsList = !showLocationsList
        }
    }
    
    func showNextLocation(location: Location) {
        withAnimation(.easeInOut) {
            mapLocation = location
            showLocationsList = false
        }
    }
}
