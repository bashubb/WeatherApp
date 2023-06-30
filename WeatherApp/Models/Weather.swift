//
//  Weather.swift
//  WeatherApp
//
//  Created by HubertMac on 30/06/2023.
//

import Foundation

struct Weather: Decodable {
    
    var coord: CoordinateIno
    var weather: [WeatherInfo]
    var base: String
    var main: MainInfo
    var visibility: Int
    var wind: WindInfo
    var clouds: CloudsInfo
    var dt: Int
    var sys: SysInfo
    var timezone: Int
    var id: Int
    var name: String
    var cod: Int
    
}

struct CoordinateIno: Decodable {
    
    var lon: Double
    var lat: Double
}

struct WeatherInfo: Decodable{
    
    var id: Int
    var main: String
    var description: String
    var icon: String
}

struct MainInfo: Decodable {
    
    var temp: Double
    var feelsLike: Double
    var tempMin: Double
    var tempMax: Double
    var pressure: Int
    var humidity: Int
}

struct WindInfo: Decodable {
    
    var speed: Double
    var deg: Int
   
}


struct CloudsInfo: Decodable {
    
    var all: Int
}

struct SysInfo: Decodable {
    
    var type: Int
    var id: Int
    var country: String
    var sunrise: Int
    var sunset: Int
}
