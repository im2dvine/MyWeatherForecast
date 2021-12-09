//
//  HomeController.swift
//  MyWeatherForecast
//
//  Created by Daesy Vences on 12/7/21.
//

import UIKit

class HomeViewModel {
    var weather: Weather?
    
    func fetchWeather(for cityId: Int = 5128581, _ completion: @escaping (() -> Void)) {
        NetworkController.fetchWeather(for: cityId) { _ in
            completion()
        }
    }
}
class HomeController: UIViewController {
    
    private let viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        viewModel.fetchWeather {
            print("We got the weather! Update the UI!")
        }
        
    }
    
    
}

