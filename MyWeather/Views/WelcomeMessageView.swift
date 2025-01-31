//
//  WelcomeMessageView.swift
//  MyWeather
//
//  Created by Abdul Hassan on 1/29/25.
//

import SwiftUI
import CoreLocationUI

struct WelcomeMessageView: View {
    @EnvironmentObject var locationManager: LocationManager
    
    var body: some View {
        VStack {
            // welcome message
            VStack(spacing: 20) {
                Text("Welcome to the Weather App")
                    .bold()
                    .font(.title)

                Text("Please share you current location to get the weather in your area")
                    .padding()
            }
            .foregroundStyle(.white)
            .multilineTextAlignment(.center)
            .padding()
            
            // share location button
            LocationButton(.shareCurrentLocation) {
                locationManager.requestLocation()
            }
            .cornerRadius(30)
            .symbolVariant(.fill)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    WelcomeMessageView()
}
