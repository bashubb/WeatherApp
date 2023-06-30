//
//  Weather.swift
//  WeatherApp
//
//  Created by HubertMac on 30/06/2023.
//

import Foundation

struct Weather: Decodable {
    
    var cord: CoordinateIno
    var weather: [WeatherInfo]
    var base: String
    var main: [MainInfo]
    var visibility: Int
    var wind: WindInfo
    var rain: RainInfo
    var clouds: CloudsInfo
    var dt: Int
    var sys: SysInfo
    var timezone: Int
    var id: Int
    var name: String
    var code: Int
    
}

struct CoordinateIno: Decodable {
    
    var lon: Double
    var lat: Double
}

struct WeatherInfo: Decodable{
    
    var id: Int
    var main: String
    var description: String
    var incon: String
}

struct MainInfo: Decodable {
    
    var temp: Double
    var feelsLike: Double
    var tempMin: Double
    var tempMax: Double
    var pressure: Int
    var humidity: Int
    var seaLever: Int
    var grndLevel: Int
}

struct WindInfo: Decodable {
    
    var speed: Double
    var deg: Int
    var gust: Double
}

struct RainInfo: Decodable {
    var oneHour: Double
    
    enum CodingKeys: String, CodingKey {
        case oneHour = "1h"
    }
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
