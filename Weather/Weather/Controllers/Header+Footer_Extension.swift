//
//  Header+Footer_Extension.swift
//  Weather
//
//  Created by Diana Agapkina on 10/12/20.
//

import Foundation
import UIKit

extension WeatherViewController {
    
    //MARK: - Adding a Separator Line
    func createSeparateLine(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat) -> UIView {
        let line = UIView(frame: CGRect(x: x, y: y, width: width, height: height))
        line.layer.borderWidth = 1.0
        line.layer.borderColor = UIColor.white.cgColor
        line.alpha = 0.37
        return line
    }
    
    //MARK: - Table View Header
    func createTableHeader() -> UIView {
        
        guard let currentWeather = self.currentWeather else { return UIView() }
        
        let headerView = UIView(frame: CGRect(x: 0,
                                              y: 0,
                                              width: view.frame.size.width,
                                              height: 200))
        
        let temperatureLabel: UILabel =  {
            let temperatureLabel = UILabel(frame: CGRect(x: 10,
                                                         y: 0,
                                                         width: view.frame.size.width,
                                                         height: 100))
            temperatureLabel.textColor = .white
            temperatureLabel.font = .systemFont(ofSize: 100, weight: .thin)
            temperatureLabel.textAlignment = .center
            temperatureLabel.text = "\(Converters.convertToCelsius(currentWeather.temperature))°"
            
            return temperatureLabel
        }()
        
        let highAndLowLabel: UILabel =  {
            let temperatureLabel = UILabel(frame: CGRect(x: 0,
                                                         y: temperatureLabel.bottom + 4,
                                                         width: view.frame.size.width,
                                                         height: 20))
            temperatureLabel.textColor = .white
            temperatureLabel.font = .systemFont(ofSize: 17)
            temperatureLabel.textAlignment = .center
            temperatureLabel.text = "H:\(Converters.convertToCelsius(self.dailyModels[0].temperatureHigh))°  L:\(Converters.convertToCelsius(self.dailyModels[0].temperatureLow))°"
            
            return temperatureLabel
        }()
        
        headerView.addSubview(temperatureLabel)
        headerView.addSubview(highAndLowLabel)
        
        return headerView
    }
    
    //MARK: - Table View Footer
    func createTableFooter() -> UIView {
        
        guard let currentWeather = self.currentWeather else { return UIView() }
        
        let footerView = UIView(frame: CGRect(x: 0,
                                              y: tableView.frame.minY,
                                              width: view.frame.size.width,
                                              height: 400))
        
        footerView.backgroundColor = UIColor(red: 163/255.0, green: 216/255.0, blue: 244/255.0, alpha: 1.0)
        footerView.addSubview(createSeparateLine(x: 0, y: 0, width: view.frame.size.width, height: 1.0))
        
        // SUMMARY
        let summaryLabel: UILabel = {
            let summaryLabel = UILabel(frame: CGRect(x: 20,
                                                     y: 0,
                                                     width: footerView.frame.size.width - 40,
                                                     height: 60))
            summaryLabel.text = "Today: \(currentWeather.summary) currently. The high will be \(Converters.convertToCelsius(self.dailyModels[0].temperatureHigh))°. The low tonight will be \(Converters.convertToCelsius(self.dailyModels[0].temperatureLow))°."
            summaryLabel.textColor = .white
            summaryLabel.textAlignment = .left
            summaryLabel.numberOfLines = 0
            summaryLabel.font = .systemFont(ofSize: 17)
            
            return summaryLabel
        }()
        footerView.addSubview(summaryLabel)
        
        footerView.addSubview(createSeparateLine(x: 0, y: 60, width: view.frame.size.width, height: 1.0))
        
        // SUNRISE
        let sunriseTitle: UILabel = {
            let sunriseTitle = UILabel(frame: CGRect(x: 20,
                                                     y: 70,
                                                     width: view.frame.size.width / 3,
                                                     height: 15))
            sunriseTitle.text = "SUNRISE"
            sunriseTitle.textColor = .white
            sunriseTitle.textAlignment = .left
            sunriseTitle.alpha = 0.5
            sunriseTitle.font = .systemFont(ofSize: 12)
            
            return sunriseTitle
        }()
        let sunriseTime: UILabel = {
            let sunriseTime = UILabel(frame: CGRect(x: 20,
                                                    y: 85,
                                                    width: view.frame.size.width / 3,
                                                    height: 30))
            sunriseTime.text = Converters.getTimeFromDate(Date(timeIntervalSince1970: Double(dailyModels[0].sunriseTime)))
            sunriseTime.textColor = .white
            sunriseTime.textAlignment = .left
            sunriseTime.font = .systemFont(ofSize: 27)
            
            return sunriseTime
        }()
        footerView.addSubview(sunriseTitle)
        footerView.addSubview(sunriseTime)
        
        // SUNSET
        let sunsetTitle: UILabel = {
            let sunsetTitle = UILabel(frame: CGRect(x: view.frame.size.width / 2,
                                                    y: 70,
                                                    width: view.frame.size.width / 3,
                                                    height: 15))
            sunsetTitle.text = "SUNSET"
            sunsetTitle.textColor = .white
            sunsetTitle.textAlignment = .left
            sunsetTitle.alpha = 0.5
            sunsetTitle.font = .systemFont(ofSize: 12)
            
            return sunsetTitle
        }()
        let sunsetTime: UILabel = {
            let sunsetTime = UILabel(frame: CGRect(x: view.frame.size.width / 2,
                                                   y: 85,
                                                   width: view.frame.size.width / 3,
                                                   height: 30))
            sunsetTime.text = Converters.getTimeFromDate(Date(timeIntervalSince1970: Double(dailyModels[0].sunsetTime)))
            sunsetTime.textColor = .white
            sunsetTime.textAlignment = .left
            sunsetTime.font = .systemFont(ofSize: 27)
            
            return sunsetTime
        }()
        footerView.addSubview(sunsetTitle)
        footerView.addSubview(sunsetTime)
        
        footerView.addSubview(createSeparateLine(x: 20, y: 120, width: view.frame.size.width-40, height: 1.0))
        
        // CHANCE OF RAIN
        let chanceOfRainTitle: UILabel = {
            let chanceOfRainTitle = UILabel(frame: CGRect(x: 20,
                                                    y: 130,
                                                    width: view.frame.size.width / 3,
                                                    height: 15))
            chanceOfRainTitle.text = "CHANCE OF RAIN"
            chanceOfRainTitle.textColor = .white
            chanceOfRainTitle.textAlignment = .left
            chanceOfRainTitle.alpha = 0.5
            chanceOfRainTitle.font = .systemFont(ofSize: 12)
            
            return chanceOfRainTitle
        }()
        let chanceOfRainNumber: UILabel = {
            let chanceOfRainNumber = UILabel(frame: CGRect(x: 20,
                                                   y: 145,
                                                   width: view.frame.size.width / 3,
                                                   height: 30))
            chanceOfRainNumber.text = "\(String(format: "%.0f", dailyModels[0].precipProbability * 100)) %"
            chanceOfRainNumber.textColor = .white
            chanceOfRainNumber.textAlignment = .left
            chanceOfRainNumber.font = .systemFont(ofSize: 27)
            
            return chanceOfRainNumber
        }()
        footerView.addSubview(chanceOfRainTitle)
        footerView.addSubview(chanceOfRainNumber)
        
        // HUMIDITY
        let humidityTitle: UILabel = {
            let humidityTitle = UILabel(frame: CGRect(x: view.frame.size.width / 2,
                                                    y: 130,
                                                    width: view.frame.size.width / 3,
                                                    height: 15))
            humidityTitle.text = "HUMIDITY"
            humidityTitle.textColor = .white
            humidityTitle.textAlignment = .left
            humidityTitle.alpha = 0.5
            humidityTitle.font = .systemFont(ofSize: 12)
            
            return humidityTitle
        }()
        let humidityNumber: UILabel = {
            let humidityNumber = UILabel(frame: CGRect(x: view.frame.size.width / 2,
                                                   y: 145,
                                                   width: view.frame.size.width / 3,
                                                   height: 30))
            humidityNumber.text = "\(String(format: "%.0f", dailyModels[0].humidity * 100)) %"
            humidityNumber.textColor = .white
            humidityNumber.textAlignment = .left
            humidityNumber.font = .systemFont(ofSize: 27)
            
            return humidityNumber
        }()
        footerView.addSubview(humidityTitle)
        footerView.addSubview(humidityNumber)
        
        footerView.addSubview(createSeparateLine(x: 20, y: 180, width: view.frame.size.width-40, height: 1.0))
        
        // WIND
        let windTitle: UILabel = {
            let windTitle = UILabel(frame: CGRect(x: 20,
                                                    y: 190,
                                                    width: view.frame.size.width / 3,
                                                    height: 15))
            windTitle.text = "WIND"
            windTitle.textColor = .white
            windTitle.textAlignment = .left
            windTitle.alpha = 0.5
            windTitle.font = .systemFont(ofSize: 12)
            
            return windTitle
        }()
        let windNumber: UILabel = {
            let windNumber = UILabel(frame: CGRect(x: 20,
                                                   y: 205,
                                                   width: view.frame.size.width / 3,
                                                   height: 30))
            windNumber.text = "\(String(format: "%.0f", dailyModels[0].windSpeed)) km/hr"
            windNumber.textColor = .white
            windNumber.textAlignment = .left
            windNumber.font = .systemFont(ofSize: 27)
            
            return windNumber
        }()
        footerView.addSubview(windTitle)
        footerView.addSubview(windNumber)
        
        // FEELS LIKE
        let feelsLikeTitle: UILabel = {
            let feelsLikeTitle = UILabel(frame: CGRect(x: view.frame.size.width / 2,
                                                    y: 190,
                                                    width: view.frame.size.width / 3,
                                                    height: 15))
            feelsLikeTitle.text = "FEELS LIKE"
            feelsLikeTitle.textColor = .white
            feelsLikeTitle.textAlignment = .left
            feelsLikeTitle.alpha = 0.5
            feelsLikeTitle.font = .systemFont(ofSize: 12)
            
            return feelsLikeTitle
        }()
        let feelsLikeNumber: UILabel = {
            let feelsLikeNumber = UILabel(frame: CGRect(x: view.frame.size.width / 2,
                                                   y: 205,
                                                   width: view.frame.size.width / 3,
                                                   height: 30))
            feelsLikeNumber.text = "\(Converters.convertToCelsius(currentWeather.temperature))°"
            feelsLikeNumber.textColor = .white
            feelsLikeNumber.textAlignment = .left
            feelsLikeNumber.font = .systemFont(ofSize: 27)
            
            return feelsLikeNumber
        }()
        footerView.addSubview(feelsLikeTitle)
        footerView.addSubview(feelsLikeNumber)
        
        footerView.addSubview(createSeparateLine(x: 20, y: 240, width: view.frame.size.width-40, height: 1.0))
        
        // PRECIPITATION
        let precipitationTitle: UILabel = {
            let precipitationTitle = UILabel(frame: CGRect(x: 20,
                                                    y: 250,
                                                    width: view.frame.size.width / 3,
                                                    height: 15))
            precipitationTitle.text = "PRECIPITATION"
            precipitationTitle.textColor = .white
            precipitationTitle.textAlignment = .left
            precipitationTitle.alpha = 0.5
            precipitationTitle.font = .systemFont(ofSize: 12)
            
            return precipitationTitle
        }()
        let precipitationNumber: UILabel = {
            let precipitationNumber = UILabel(frame: CGRect(x: 20,
                                                   y: 265,
                                                   width: view.frame.size.width / 3,
                                                   height: 30))
            precipitationNumber.text = "\(String(format: "%.1f", dailyModels[0].precipIntensity * 100)) cm"
            precipitationNumber.textColor = .white
            precipitationNumber.textAlignment = .left
            precipitationNumber.font = .systemFont(ofSize: 27)
            
            return precipitationNumber
        }()
        footerView.addSubview(precipitationTitle)
        footerView.addSubview(precipitationNumber)
        
        // PRESSURE
        let pressureTitle: UILabel = {
            let pressureTitle = UILabel(frame: CGRect(x: view.frame.size.width / 2,
                                                    y: 250,
                                                    width: view.frame.size.width / 3,
                                                    height: 15))
            pressureTitle.text = "PRESSURE"
            pressureTitle.textColor = .white
            pressureTitle.textAlignment = .left
            pressureTitle.alpha = 0.5
            pressureTitle.font = .systemFont(ofSize: 12)
            
            return pressureTitle
        }()
        let pressureNumber: UILabel = {
            let pressureNumber = UILabel(frame: CGRect(x: view.frame.size.width / 2,
                                                   y: 265,
                                                   width: view.frame.size.width / 3,
                                                   height: 30))
            pressureNumber.text = "\(Int(dailyModels[0].pressure)) hPa"
            pressureNumber.textColor = .white
            pressureNumber.textAlignment = .left
            pressureNumber.font = .systemFont(ofSize: 27)
            
            return pressureNumber
        }()
        footerView.addSubview(pressureTitle)
        footerView.addSubview(pressureNumber)
        
        footerView.addSubview(createSeparateLine(x: 20, y: 300, width: view.frame.size.width-40, height: 1.0))
        
        // VISIBILITY
        let visibilityTitle: UILabel = {
            let visibilityTitle = UILabel(frame: CGRect(x: 20,
                                                    y: 310,
                                                    width: view.frame.size.width / 3,
                                                    height: 15))
            visibilityTitle.text = "VISIBILITY"
            visibilityTitle.textColor = .white
            visibilityTitle.textAlignment = .left
            visibilityTitle.alpha = 0.5
            visibilityTitle.font = .systemFont(ofSize: 12)
            
            return visibilityTitle
        }()
        let visibilityNumber: UILabel = {
            let visibilityNumber = UILabel(frame: CGRect(x: 20,
                                                   y: 325,
                                                   width: view.frame.size.width / 3,
                                                   height: 30))
            visibilityNumber.text = "\(String(format: "%.1f", dailyModels[0].visibility)) km"
            visibilityNumber.textColor = .white
            visibilityNumber.textAlignment = .left
            visibilityNumber.font = .systemFont(ofSize: 27)
            
            return visibilityNumber
        }()
        footerView.addSubview(visibilityTitle)
        footerView.addSubview(visibilityNumber)
        
        // UV INDEX
        let uvIndexTitle: UILabel = {
            let uvIndexTitle = UILabel(frame: CGRect(x: view.frame.size.width / 2,
                                                    y: 310,
                                                    width: view.frame.size.width / 3,
                                                    height: 15))
            uvIndexTitle.text = "UV INDEX"
            uvIndexTitle.textColor = .white
            uvIndexTitle.textAlignment = .left
            uvIndexTitle.alpha = 0.5
            uvIndexTitle.font = .systemFont(ofSize: 12)
            
            return uvIndexTitle
        }()
        let uvIndexNumber: UILabel = {
            let uvIndexNumber = UILabel(frame: CGRect(x: view.frame.size.width / 2,
                                                   y: 325,
                                                   width: view.frame.size.width / 3,
                                                   height: 30))
            uvIndexNumber.text = "\(dailyModels[0].uvIndex)"
            uvIndexNumber.textColor = .white
            uvIndexNumber.textAlignment = .left
            uvIndexNumber.font = .systemFont(ofSize: 27)
            
            return uvIndexNumber
        }()
        footerView.addSubview(uvIndexTitle)
        footerView.addSubview(uvIndexNumber)
        
        footerView.addSubview(createSeparateLine(x: 20, y: 360, width: view.frame.size.width-40, height: 1.0))
        
        return footerView
        
    }
    
}
