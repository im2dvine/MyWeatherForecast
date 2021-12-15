//
//  Double+TempConversion.swift
//  MyWeatherForecast
//
//  Created by Daesy Vences on 12/15/21.
//

import Foundation

extension Double {
    var kelvinToFahrenheit: Double {
        return (9.0 / 5) * (self - 273) + 32
    }
}
