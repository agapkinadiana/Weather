//
//  Header+Footer_Extension.swift
//  Weather
//
//  Created by Diana Agapkina on 10/12/20.
//

import Foundation
import UIKit

extension WeatherViewController {
    
    //MARK: - Table View Header
    func createTableHeader() -> UIView {
        
        let headerView = UIView(frame: CGRect(x: 0,
                                              y: 0,
                                              width: view.frame.size.width,
                                              height: 150))
        
        let temperatureLabel: UILabel =  {
            let temperatureLabel = UILabel(frame: CGRect(x: 10,
                                                         y: 0,
                                                         width: view.frame.size.width,
                                                         height: 100))
            temperatureLabel.textColor = .white
            temperatureLabel.font = .systemFont(ofSize: 100, weight: .thin)
            temperatureLabel.textAlignment = .center
            temperatureLabel.text = "11°"
            
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
            temperatureLabel.text = "H:10°  L:20°"
            
            return temperatureLabel
        }()
        
        headerView.addSubview(temperatureLabel)
        headerView.addSubview(highAndLowLabel)
        
        return headerView
    }
}
