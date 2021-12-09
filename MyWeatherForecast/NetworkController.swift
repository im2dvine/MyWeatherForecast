//
//  NetworkController.swift
//  MyWeatherForecast
//
//  Created by Daesy Vences on 12/7/21.
//

import Foundation

struct NetworkController {
    
    private static var baseUrl = "api.openweathermap.org"
    private static let apiKey = "56d6ee556c449661e94dc7e4eecbfb95"
    
    
    enum Endpoint {
        case cityId(path: String = "/data/2.5/weather", id: Int)
        
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
            
            queryItems.append(URLQueryItem(name: "appid", value: apiKey))
            
            return queryItems
        }
    }
    
    //5128581 New York
    static func fetchWeather(for cityId: Int = 5128581, _ completion: @escaping ((Weather) -> Void)) {
        if let url = Endpoint.cityId(id: cityId).url {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    print("Whoops! An error occurred!", error)
                }
                
                if let data = data {
                    
                    do {
                        let weather = try JSONDecoder().decode(Weather.self, from: data)
                        completion(weather)
                    } catch let error {
                        print("failed to decode object number 2", error)
                    }
                                    }
            }.resume()
        }
    }
    
    //    static func fetchMailMessages(_ completion: @escaping (([Mail.Message]) -> Void)) {
    //
    //    }
}
