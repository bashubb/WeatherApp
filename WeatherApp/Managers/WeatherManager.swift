//
//  WeatherManager.swift
//  WeatherApp
//
//  Created by HubertMac on 30/06/2023.
//

import Foundation
import CoreLocation

class WeatherManager {

    
    func getCurrentWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws -> Weather {
        
        
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=\("a677ed26d3143189c3b4e7cc1d1c6481")&units=metric") else { fatalError("missing URL")}
        
        // Create a url request
        let urlRequest = URLRequest(url: url)
        
        let(data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error fetching weather data")}
        
        let decoder = JSONDecoder()
        
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let decodedData = try decoder.decode(Weather.self, from: data)
        
        return decodedData
        
        
        
    }
    
}
