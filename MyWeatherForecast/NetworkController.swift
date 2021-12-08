//
//  NetworkController.swift
//  MyWeatherForecast
//
//  Created by Daesy Vences on 12/7/21.
//

import Foundation

struct NetworkController {
    
    private static var baseUrl = "api.openweathermap.org"
//    private static var path = "/data/2.5/onecall"
    
    
    enum EndPoint {
        case cityId(path: String = "/data/2.5/onecall", id: Int)
        
        var url: URL? {
            var components = URLComponents()
            components.scheme = "https"
            components.host = baseUrl
            components.path = path
            components.queryItems = queryItems
            
            return components.url
        }
        
        private var path: String {
            switch self {
            case .cityId(let path, _):
                return path
            }
        }
        
        private var queryItems: [URLQueryItem] {
            
            var queryItems = [URLQueryItem]()
            
            switch self {
            case .cityId(_, let id):
                queryItems.append(URLQueryItem(name: "id", value: String(id)))
            }
            queryItems.append(URLQueryItem(name: "appid", value: "1234"))
            
            return queryItems
        }
    }
    
//    static func fetchMailMessages(_ completion: @escaping (([Mail.Message]) -> Void)) {
//
//    }
    
}
