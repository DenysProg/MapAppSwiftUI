//
//  Location.swift
//  MapAppSwiftUI
//
//  Created by Denys Nikolaichuk on 08.03.2023.
//

import Foundation
import MapKit

struct Location: Identifiable {
    let name: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    let link: String
    
    var id: String {
        name + cityName
    }
}
