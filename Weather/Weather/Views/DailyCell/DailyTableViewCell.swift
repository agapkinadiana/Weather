//
//  DailyTableViewCell.swift
//  Weather
//
//  Created by Diana Agapkina on 10/13/20.
//

import UIKit

class DailyTableViewCell: UITableViewCell {

    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var lowTempLabel: UILabel!
    @IBOutlet weak var highTempLabel: UILabel!
    
    static let identifier = "DailyTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "DailyTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = .clear
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configure(with model: DailyWeatherData) {
        
        self.dayLabel.text = Converters.getDayFromDate(Date(timeIntervalSince1970: Double(model.time)))
        self.lowTempLabel.text = "\(Converters.convertToCelsius(model.temperatureLow))"
        self.highTempLabel.text = "\(Converters.convertToCelsius(model.temperatureHigh))"
        
        let icon = model.icon.lowercased()
        self.iconImageView.image = IconSet.setIcon(for: icon)
    }
    
}
