//
//  WeatherLocationManager.swift
//  Weather
//
//  Created by Diana Agapkina on 10/13/20.
//

import Foundation
import CoreLocation

extension WeatherViewController: CLLocationManagerDelegate {
    
    func setupLocation() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if !locations.isEmpty, currentLocation == nil {
            currentLocation = locations.first
            locationManager.stopUpdatingLocation()
            requestWeatherForLocation()
        }
    }
    
    func requestWeatherForLocation() {
        
        guard let currentLocation = currentLocation else { return }
        let latitude = currentLocation.coordinate.latitude
        let longitude = currentLocation.coordinate.longitude
        
        let url = "https://api.darksky.net/forecast/6a92402c27dfc4740168ec5c0673a760/\(latitude),\(longitude)?exclude=[flags,minutely]"
        
        
    }
    
}
