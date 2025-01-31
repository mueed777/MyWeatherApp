//
//  ContentView.swift
//  MyWeather
//
//  Created by Abdul Hassan on 1/28/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var viewModel: WeatherModel?
    
    var body: some View {
        VStack {
            if let location = locationManager.location {
                if let viewModel = viewModel {
//                    Text("Weather data is fetched!👻👻👻")
//                    Text("My place: \(viewModel.name)")
                    WeatherView(viewModel: viewModel)
                } else {
                    Text("Loading geting weather....")
                        .task {
                            do {
                                viewModel = try await weatherManager.getCurrentWeather(longitude: location.longitude, lattitude: location.latitude)
                            } catch {
                                print("Error getting weather: \(error)")
                            }
                        }
                }
            } else {
                if locationManager.isLoading {
                    Text("loading...")
                } else {
                    WelcomeMessageView()
                        .environmentObject(locationManager)
                }
            }
        }
        .foregroundStyle(.white)
        .background(Color(hue: 0.689, saturation: 0.689, brightness: 0.493))
    }
}

#Preview {
    ContentView()
}
