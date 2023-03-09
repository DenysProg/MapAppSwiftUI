//
//  LocationPreviewView.swift
//  MapAppSwiftUI
//
//  Created by Denys Nikolaichuk on 09.03.2023.
//

import SwiftUI
import CoreLocation

struct LocationPreviewView: View {
    @EnvironmentObject private var viewModel: LocationsViewModel
    let location: Location
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 0) {
            VStack(alignment: .leading, spacing: 16) {
                imageSection
                titleSection
            }
            
            VStack(spacing: 8) {
                learnMorebutton
                nextButton
            }
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(.ultraThinMaterial)
                .offset(y: 65)
        )
        .cornerRadius(10)
    }
}

struct LocationPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.green.ignoresSafeArea()
            
            LocationPreviewView(location: Location(
                name: "Colosseum",
                cityName: "Rome",
                coordinates: CLLocationCoordinate2D(latitude: 41.8902, longitude: 12.4922),
                description: "The Colosseum is an oval amphitheatre in the centre of the city of Rome, Italy, just east of the Roman Forum. It is the largest ancient amphitheatre ever built, and is still the largest standing amphitheatre in the world today, despite its age.",
                imageNames: [
                    "rome-colosseum-1",
                    "rome-colosseum-2",
                    "rome-colosseum-3",
                ],
                link: "https://en.wikipedia.org/wiki/Colosseum"))
            .padding()
        }
        .environmentObject(LocationsViewModel())
    }
}

extension LocationPreviewView {
    private var imageSection: some View {
        ZStack {
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
            }
        }
        .padding(6)
        .background(.white)
        .cornerRadius(10)
    }
    
    private var titleSection: some View {
        VStack(alignment: .leading) {
            Text(location.name)
                .font(.title2)
                .fontWeight(.bold)
            
            Text(location.cityName)
                .font(.subheadline)
        }
        .frame(maxWidth: .infinity, alignment: .leading)

    }
    
    private var learnMorebutton: some View {
        Button {
            viewModel.sheetLocation = location
        } label: {
            Text("Learn more")
                .font(.headline)
                .frame(width: 125, height: 35)
        }
        .buttonStyle(.borderedProminent)
    }
    
    private var nextButton: some View {
        Button {
            viewModel.nextButtonPressed()
        } label: {
            Text("Next")
                .font(.headline)
                .frame(width: 125, height: 35)
        }
        .buttonStyle(.bordered)
    }
}
