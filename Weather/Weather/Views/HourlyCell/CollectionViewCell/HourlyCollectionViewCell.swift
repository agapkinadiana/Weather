//
//  HourlyCollectionViewCell.swift
//  Weather
//
//  Created by Diana Agapkina on 10/13/20.
//

import UIKit

class HourlyCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var probabilityLabel: UILabel!
    
    static let identifier = "HourlyCollectionViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "HourlyCollectionViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = UIColor(named: "lightGray")
    }
    
    func configure(with model: HourlyWeatherData) {
        
        self.timeLabel.text = Converters.getHourFromTime(Date(timeIntervalSince1970: TimeInterval(model.time)))
        self.tempLabel.text = "\(Converters.convertToCelsius(model.temperature))°"
        self.iconImageView.contentMode = .center
        
        let icon = model.icon.lowercased()
        
        self.iconImageView.image = IconSet.setIcon(for: icon)
        
        if icon == "rain" || icon == "snow" {
            self.probabilityLabel.text = "\(String(format: "%.0f", model.precipProbability * 100)) %"
        } else {
            self.probabilityLabel.text = ""
        }
    }

}
