//
//  WeatherManager.swift
//  MyWeather
//
//  Created by Abdul Hassan on 1/29/25.
//

import Foundation
import CoreLocation

class WeatherManager {
    func getCurrentWeather(longitude: CLLocationDegrees, lattitude: CLLocationDegrees) async throws -> WeatherModel {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(lattitude)&lon=\(longitude)&appid=135b4680f495e1a1ca73bef01fc0628e&units=imperial"

        guard
            let url = URL(string: urlString)
        else {
            fatalError("Missing/wrong url")
        }
        
        let urlRequest = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)

        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            fatalError("Error fetching weather data")
        }

        let decodedData = try JSONDecoder().decode(WeatherModel.self, from: data)
        return decodedData
    }
}
