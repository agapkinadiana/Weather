//
//  Converters.swift
//  Weather
//
//  Created by Diana Agapkina on 10/13/20.
//

import Foundation

struct Converters {
    
    static func getDayFromDate(_ date: Date?) -> String {
        
        guard let inputDate = date else { return ""}
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: inputDate)
        
    }
    
    static func getTimeFromDate(_ date: Date?) -> String {
        
        guard let inputDate = date else { return ""}
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: inputDate)
        
    }
    
    static func getHourFromTime(_ date: Date?) -> String {
        
        guard let inputDate = date else { return ""}
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h"
        return dateFormatter.string(from: inputDate)
        
    }
    
    static func convertToCelsius(_ fahrenheit: Double) -> Int {
        return Int(5.0 / 9.0 * (Double(fahrenheit) - 32.0))
    }
    
    static func removeUnusedTextAndCharacters(_ text: String) -> String {
        
        var editedText = ""
        
        if let index = (text.range(of: "/")?.upperBound) {
            editedText = String(text.suffix(from: index))

            return editedText
        }
        return text
    }
    
}
