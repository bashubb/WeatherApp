//
//  WeatherManager.swift
//  WeatherApp
//
//  Created by HubertMac on 30/06/2023.
//

import Foundation
import CoreLocation

class WeatherManager: ObservableObject {

    @Published var weather: [Weather]?
    
    init() {
        
    }
    
    func getCurrentWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=\("a677ed26d3143189c3b4e7cc1d1c6481")&units=metric") else { fatalError("missing URL")}
        
        // Create a url request
        let urlRequest = URLRequest(url: url)
        
        // Create a session
        let session = URLSession.shared
        
        // Create a data task
        let dataTask = session.dataTask(with: urlRequest) { data, response, error in
            
            // Check for error
            if let error = error {
                print(error.localizedDescription)
            } else if data != nil {
                do {
                    
                    let decoder = JSONDecoder()
                    
                    let data = try decoder.decode([Weather].self, from: data!)
                    
                    DispatchQueue.main.async {
                        self.weather = data
                    }
                    
                } catch {
                    print("Error with data")
                }
            }
        }
        dataTask.resume()
        
        
        
        
    }
}
