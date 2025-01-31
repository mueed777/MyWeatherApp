//
//  MockData.swift
//  MyWeather
//
//  Created by Abdul Hassan on 1/30/25.
//

import Foundation

var previewWeather: WeatherModel = loadData("MockData.json")

func loadData<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard
        let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Coulnd't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let deocder = JSONDecoder()
        return try deocder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
