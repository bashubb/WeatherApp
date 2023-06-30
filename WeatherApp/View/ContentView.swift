//
//  ContentView.swift
//  WeatherApp
//
//  Created by HubertMac on 30/06/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    var body: some View {
        VStack {
            
            if let location = locationManager.location {
                Text("Your cooridinates are \(location.longitude), \(location.latitude)")
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
