//
//  MapAppSwiftUIApp.swift
//  MapAppSwiftUI
//
//  Created by Denys Nikolaichuk on 08.03.2023.
//

import SwiftUI

@main
struct MapAppSwiftUIApp: App {
    @StateObject private var viewModel = LocationsViewModel()
    
    var body: some Scene {
        WindowGroup {
            LocationView()
                .environmentObject(viewModel)
        }
    }
}
