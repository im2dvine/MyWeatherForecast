//
//  Weather.swift
//  MyWeatherForecast
//
//  Created by Daesy Vences on 12/7/21.
//

import Foundation

struct Weather: Decodable {
    var current: [Current]
    
    struct Current: Decodable {
        var sunrise: Int
        var sunset: Int
        var temp: Double
        var feelsLike: Double
        var humidity: Int
        var clouds: Int
        
        enum CodingKeys: String, CodingKey {
            case feelsLike = "feels_like"
            case sunrise
            case sunset
            case temp
            case humidity
            case clouds
        }
    }
}
