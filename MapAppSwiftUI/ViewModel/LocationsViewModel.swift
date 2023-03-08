//
//  LocationsViewModel.swift
//  MapAppSwiftUI
//
//  Created by Denys Nikolaichuk on 08.03.2023.
//

import Foundation

final class LocationsViewModel: ObservableObject {
    @Published var locations: [Location]?
    
    init() {
        getLocations()
    }
    
    private func getLocations() {
        let locations = LocationsDataService.locations
        self.locations = locations
    }
}
