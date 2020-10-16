//
//  HeaderView.swift
//  Weather
//
//  Created by Diana Agapkina on 10/15/20.
//

import UIKit

class HeaderView: UIView, UICollectionViewDelegateFlowLayout {
    
    var hourlyModels = [HourlyWeatherData]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(collectionView)
        
        collectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        cv.showsHorizontalScrollIndicator = false
        cv.showsVerticalScrollIndicator = false
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.delegate = self
        cv.dataSource = self
        cv.register(HourlyCollectionViewCell.nib(), forCellWithReuseIdentifier: HourlyCollectionViewCell.identifier)
        cv.backgroundColor = UIColor(named: "lightGray")
        return cv
    }()
    
    func configure(with model: [HourlyWeatherData]) {
        
        self.hourlyModels = model
        collectionView.reloadData()
    }
    
}

extension HeaderView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return hourlyModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HourlyCollectionViewCell.identifier,                                              for: indexPath) as! HourlyCollectionViewCell
        
        cell.configure(with: hourlyModels[indexPath.row])
        if indexPath.row == 0 {
            cell.timeLabel.text = "Now"
            cell.probabilityLabel.text = ""
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 40, height: 105)
    }
}
