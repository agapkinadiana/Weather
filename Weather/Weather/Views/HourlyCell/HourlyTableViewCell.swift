//
//  HourlyTableViewCell.swift
//  Weather
//
//  Created by Diana Agapkina on 10/13/20.
//

import UIKit

class HourlyTableViewCell: UITableViewCell, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var hourlyModels = [HourlyWeatherData]()
    
    static let identifier = "HourlyTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "HourlyTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.register(HourlyCollectionViewCell.nib(), forCellWithReuseIdentifier: HourlyCollectionViewCell.identifier)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.backgroundColor = UIColor(red: 163/255.0, green: 216/255.0, blue: 244/255.0, alpha: 1.0)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(with model: [HourlyWeatherData]) {
        
        self.hourlyModels = model
        collectionView.reloadData()
    }
    
}

extension HourlyTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return hourlyModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HourlyCollectionViewCell.identifier,                                              for: indexPath) as! HourlyCollectionViewCell
        
        cell.configure(with: hourlyModels[indexPath.row])
        if indexPath.row == 0 {
            cell.timeLabel.text = "Now"
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 45, height: 105)
    }
}
