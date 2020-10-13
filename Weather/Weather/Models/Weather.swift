//
//  Weather.swift
//  Weather
//
//  Created by Diana Agapkina on 10/13/20.
//

import Foundation

struct Weather: Codable {
    
    let latitude:   Float
    let longitude:  Float
    let timezone:   String
    let currently:  CurrentWeather
    let hourly:     HourlyWeather
    let daily:      DailyWeather
}
