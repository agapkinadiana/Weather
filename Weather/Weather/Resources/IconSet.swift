//
//  IconSet.swift
//  Weather
//
//  Created by Diana Agapkina on 10/13/20.
//

import Foundation
import UIKit

struct IconSet {
    
    static func setIcon(for icon: String) -> UIImage {
        
        if icon.contains("clear-day") {
            return (UIImage(systemName: "sun.max.fill")?.withRenderingMode(.alwaysOriginal))!
        } else if icon.contains("clear-night") {
            return (UIImage(systemName: "moon.stars.fill")?.withRenderingMode(.alwaysOriginal))!
        } else if icon.contains("rain") {
            return (UIImage(systemName: "cloud.rain.fill")?.withRenderingMode(.alwaysOriginal))!
        } else if icon.contains("snow") {
            return (UIImage(systemName: "snow")?.withRenderingMode(.alwaysOriginal))!
        } else if icon.contains("sleet") {
            return (UIImage(systemName: "cloud.sleet.fill")?.withRenderingMode(.alwaysOriginal))!
        } else if icon.contains("wind") {
            return (UIImage(systemName: "wind")?.withRenderingMode(.alwaysOriginal))!
        } else if icon.contains("fog") {
            return (UIImage(systemName: "cloud.fog.fill")?.withRenderingMode(.alwaysOriginal))!
        } else if icon.contains("partly-cloudy-day") {
            return (UIImage(systemName: "cloud.sun.fill")?.withRenderingMode(.alwaysOriginal))!
        } else if icon.contains("partly-cloudy-night") {
            return (UIImage(systemName: "cloud.moon.fill")?.withRenderingMode(.alwaysOriginal))!
        } else {
            return (UIImage(systemName: "cloud.fill")?.withRenderingMode(.alwaysOriginal))!
        }
        
    }
    
}
