//
//  ContentView.swift
//  WeatherApp
//
//  Created by HubertMac on 30/06/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather: Weather?
    
    var body: some View {
        VStack {
            
            if let location = locationManager.location {
                if let weather = weather {
                    Text("Weather data fechted")
                } else {
                    LoadingView()
                        .task {
                            do {
                                weather = try await
                                weatherManager.getCurrentWeather(
                                    latitude: location.latitude,
                                    longitude: location.longitude)
                            } catch {
                                print("Error getting weather \(error)")
                            }
                        }
                }
                
            } else {
                if locationManager.isLoading {
                    LoadingView()
                } else {
                    WelcomeView()
                         .environmentObject(locationManager)
                }
            }
           
        }
        .background(Color(hue: 0.648, saturation: 0.8, brightness: 0.456))
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
