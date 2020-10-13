//
//  HourlyWeatherData.swift
//  Weather
//
//  Created by Diana Agapkina on 10/13/20.
//

import Foundation

struct HourlyWeatherData: Codable {
    
    let time:                   Int
    let summary:                String
    let icon:                   String
    let precipIntensity:        Float
    let precipProbability:      Double
    let precipType:             String?
    let temperature:            Double
    let apparentTemperature:    Double
    let dewPoint:               Double
    let humidity:               Double
    let pressure:               Double
    let windSpeed:              Double
    let windGust:               Double
    let windBearing:            Int
    let cloudCover:             Double
    let uvIndex:                Int
    let visibility:             Double
    let ozone:                  Double
    
}
