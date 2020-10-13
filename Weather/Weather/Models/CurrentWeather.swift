//
//  CurrentWeather.swift
//  Weather
//
//  Created by Diana Agapkina on 10/13/20.
//

import Foundation

struct CurrentWeather: Codable {
    
    let time:            Int
    let summary:         String
    let icon:            String
    let temperature:     Double
    let humidity:        Double
    let pressure:        Double
    let windSpeed:       Double
    let windGust:        Double
    let windBearing:     Int
    let cloudCover:      Double
    let uvIndex:         Int
    let visibility:      Double
    let ozone:           Double
    
}
