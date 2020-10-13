//
//  DailyWeatherData.swift
//  Weather
//
//  Created by Diana Agapkina on 10/13/20.
//

import Foundation

struct DailyWeatherData {
    
    let time:                           Int
    let summary:                        String
    let icon:                           String
    let sunriseTime:                    Int
    let sunsetTime:                     Int
    let moonPhase:                      Double
    let precipIntensity:                Float
    let precipIntensityMax:             Float
    let precipIntensityMaxTime:         Int
    let precipProbability:              Double
    let precipType:                     String?
    let temperatureHigh:                Double
    let temperatureLow:                 Double
    let dewPoint:                       Double
    let humidity:                       Double
    let pressure:                       Double
    let windSpeed:                      Double
    let windGust:                       Double
    let windGustTime:                   Int
    let windBearing:                    Int
    let cloudCover:                     Double
    let uvIndex:                        Int
    let visibility:                     Double
    let ozone:                          Double
    let temperatureMin:                 Double
    let temperatureMax:                 Double
    
}
