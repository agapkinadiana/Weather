//
//  DailyWeather.swift
//  Weather
//
//  Created by Diana Agapkina on 10/13/20.
//

import Foundation

struct DailyWeather: Codable {
    
    let summary:    String
    let icon:       String
    let data:       [DailyWeatherData]
    
}
