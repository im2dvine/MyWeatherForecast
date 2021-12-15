//
//  Weather.swift
//  MyWeatherForecast
//
//  Created by Daesy Vences on 12/7/21.
//

import Foundation

struct Weather: Decodable {
    var name: String
    var main: Main
    
    struct Main: Decodable {
//        var sunrise: Int
//        var sunset: Int
        var temp: Double
        var feelsLike: Double
        var tempMin: Double
        var tempMax: Double
        var pressure: Double
        var humidity: Double
//        var clouds: Int
        
        enum CodingKeys: String, CodingKey {
            case feelsLike = "feels_like"
            case tempMin = "temp_min"
            case tempMax = "temp_max"
//            case sunrise
//            case sunset
            case temp
            case pressure
            case humidity
//            case clouds
        }
    }
}

extension Weather {
    var temp: Double {
        return main.temp
    }
    
    var feelsLike: Double {
        return main.feelsLike
    }
    
    var minTemperature: Double {
        return main.tempMin
    }
    
    var maxTemperature: Double {
        return main.tempMax
    }
    
    var pressure: Double {
        return main.pressure
    }
    
    var humidity: Double {
        return main.humidity
    }
}
