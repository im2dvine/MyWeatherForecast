//
//  HomeController.swift
//  MyWeatherForecast
//
//  Created by Daesy Vences on 12/7/21.
//

import UIKit

class HomeViewModel {
    var weather: Weather?
    
    private var main: Weather.Main? {
        return weather?.main
    }
    
    var temperatureString: String {
        return String(weather?.main.temp ?? 0)
    }
    
    var nameString: String {
        return String(weather?.name ?? "")
    }
    
    func fetchWeather(for cityId: Int = 5128581, _ completion: @escaping (() -> Void)) {
        NetworkController.fetchWeather(for: cityId) { weather in
            self.weather = weather
            completion()
        }
    }
}
class HomeController: UIViewController {

    private let viewModel = HomeViewModel()
    
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        viewModel.fetchWeather { [weak self] in
            DispatchQueue.main.async {
                self?.setupUI()
                
            }
        }
        
    }
    
    private func setupUI() {
        temperatureLabel.text = viewModel.temperatureString
        nameLabel.text = viewModel.nameString
        
    }
    
}

