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
    
    static let identifier = "HourlyCollectionViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "HourlyCollectionViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = UIColor(red: 163/255.0, green: 216/255.0, blue: 244/255.0, alpha: 1.0)
    }
    
    func configure(with model: HourlyWeatherData) {
        
        self.timeLabel.text = Converters.getHourFromTime(Date(timeIntervalSince1970: TimeInterval(model.time)))
        self.tempLabel.text = "\(Converters.convertToCelsius(model.temperature))°"
        self.iconImageView.contentMode = .scaleAspectFit
        
        let icon = model.icon.lowercased()        
        self.iconImageView.image = IconSet.setIcon(for: icon)
    }

}
