//
//  ViewController.swift
//  Weather
//
//  Created by Diana Agapkina on 10/12/20.
//

import UIKit

class WeatherViewController: UIViewController {
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    private let locationLabel: UILabel = {
        let locationLabel = UILabel()
        
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        //locationLabel.textAlignment = .center
        locationLabel.font = UIFont(name: "HelveticaNeue", size: 30)
        locationLabel.numberOfLines = 1
        locationLabel.textColor = .white
        locationLabel.lineBreakMode = .byTruncatingTail
        locationLabel.text = "Minsk"
        
        return locationLabel
    }()
    
    private let summaryLabel: UILabel = {
        let summaryLabel = UILabel()
        
        summaryLabel.translatesAutoresizingMaskIntoConstraints = false
        //summaryLabel.textAlignment = .center
        summaryLabel.font = UIFont(name: "HelveticaNeueLight", size: 17)
        summaryLabel.numberOfLines = 1
        summaryLabel.textColor = .white
        summaryLabel.lineBreakMode = .byTruncatingTail
        summaryLabel.text = "lalala"
        
        return summaryLabel
    }()
    
    private let tableView: UITableView = {
        let table = UITableView()
        
        table.translatesAutoresizingMaskIntoConstraints = false
        
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 163/255.0, green: 216/255.0, blue: 244/255.0, alpha: 1.0)
        tableView.backgroundColor = UIColor(red: 255/255.0, green: 216/255.0, blue: 244/255.0, alpha: 1.0)
        
        view.addSubview(stackView)
        view.addSubview(tableView)
        stackView.addSubview(locationLabel)
        stackView.addSubview(summaryLabel)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        stackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 10.0).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -10.0).isActive = true
        stackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 65.0).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 70.0).isActive = true
        
        locationLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        summaryLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        summaryLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 5.0).isActive = true
        
        tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 10.0).isActive = true
        
    }
    
    
}

