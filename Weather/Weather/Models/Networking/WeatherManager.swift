//
//  WeatherManager.swift
//  Weather
//
//  Created by Diana Agapkina on 10/13/20.
//

import Foundation
import UIKit
import CoreLocation

protocol WeatherManagerDelegate: class {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: Weather)
    func didRecieveError(_ error: String)
}

struct WeatherManager {
    
    weak var delegate: WeatherManagerDelegate?
    
    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        
        let urlString = "https://api.darksky.net/forecast/6a92402c27dfc4740168ec5c0673a760/\(latitude),\(longitude)?exclude=[flags,minutely]"
        
        URLSession.shared.dataTask(with: URL(string: urlString)!) { (data, response, error) in
            
            guard let data = data, error == nil else {
                
                if let weatherData = UserDefaults.standard.data(forKey: "weatherData") {
                    do {
                        let decoder = JSONDecoder()
                        let weather = try decoder.decode(Weather.self, from: weatherData)
                        self.delegate?.didUpdateWeather(self, weather: weather)

                    } catch {
                        self.delegate?.didRecieveError(error.localizedDescription)
                    }
                }
                
                return
            }
            
            var json: Weather?
            
            do {
                json = try JSONDecoder().decode(Weather.self, from: data)
                let encodeData = try JSONEncoder().encode(json)
                UserDefaults.standard.set(encodeData, forKey: "weatherData")
            } catch {
                self.delegate?.didRecieveError(error.localizedDescription)
            }
            
            guard let weather = json else { return }
            self.delegate?.didUpdateWeather(self, weather: weather)
            
        }.resume()
        
    }
    
}
