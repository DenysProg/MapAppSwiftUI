//
//  LocationView.swift
//  MapAppSwiftUI
//
//  Created by Denys Nikolaichuk on 08.03.2023.
//

import SwiftUI

struct LocationView: View {
    @EnvironmentObject private var viewModel: LocationsViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.locations ?? []) { location in 
                Text(location.name)
            }
        }
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
            .environmentObject(LocationsViewModel())
    }
}
