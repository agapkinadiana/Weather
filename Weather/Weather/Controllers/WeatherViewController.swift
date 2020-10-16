//
//  ViewController.swift
//  Weather
//
//  Created by Diana Agapkina on 10/12/20.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController {
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let locationLabel: UILabel = {
        let locationLabel = UILabel()
        
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.textAlignment = .center
        locationLabel.font = .systemFont(ofSize: 35)
        locationLabel.numberOfLines = 1
        locationLabel.textColor = .white
        locationLabel.lineBreakMode = .byTruncatingTail
        
        return locationLabel
    }()
    
    let summaryLabel: UILabel = {
        let summaryLabel = UILabel()
        
        summaryLabel.translatesAutoresizingMaskIntoConstraints = false
        summaryLabel.textAlignment = .center
        summaryLabel.font = .systemFont(ofSize: 18, weight: .medium)
        summaryLabel.numberOfLines = 1
        summaryLabel.textColor = .white
        summaryLabel.lineBreakMode = .byTruncatingTail
        
        return summaryLabel
    }()
    
    let headerView: UIView = {
        let headerView = UIView()
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        return headerView
    }()
    
    let temperatureLabel: UILabel =  {
        let temperatureLabel = UILabel()
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        temperatureLabel.textColor = .white
        temperatureLabel.font = .systemFont(ofSize: 100, weight: .thin)
        temperatureLabel.textAlignment = .center
        
        return temperatureLabel
    }()
    
    let highAndLowLabel: UILabel =  {
        let highAndLowLabel = UILabel()
        highAndLowLabel.translatesAutoresizingMaskIntoConstraints = false
        highAndLowLabel.textColor = .white
        highAndLowLabel.font = .systemFont(ofSize: 17)
        highAndLowLabel.textAlignment = .center
        
        return highAndLowLabel
    }()
    
    let tableView: UITableView = {
        let table = UITableView()
        
        table.translatesAutoresizingMaskIntoConstraints = false
        table.allowsSelection = false
        
        return table
    }()
    
    var headerViewHeight: NSLayoutConstraint = NSLayoutConstraint()
    
    let maxHeaderHeight: CGFloat = 210
    let minHeaderHeight: CGFloat = 0
    var previousScrollOffset: CGFloat = 0
    
    let locationManager = CLLocationManager()
    var currentLocation: CLLocation?
    var weatherManager = WeatherManager()
    var currentWeather: CurrentWeather?
    
    var dailyModels = [DailyWeatherData]()
    var hourlyModels: [HourlyWeatherData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "lightGray")
        
        view.addSubview(stackView)
        view.addSubview(headerView)
        view.addSubview(tableView)
        
        headerView.addSubview(temperatureLabel)
        headerView.addSubview(highAndLowLabel)
        
        headerViewHeight = NSLayoutConstraint(item: headerView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: maxHeaderHeight)
        
        stackView.addSubview(locationLabel)
        stackView.addSubview(summaryLabel)
        
        tableView.backgroundColor = UIColor(named: "lightGray")
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        
        tableView.register(DailyTableViewCell.nib(), forCellReuseIdentifier: "DailyTableViewCell")
        
        tableView.delegate = self
        tableView.dataSource = self
        
        weatherManager.delegate = self
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupLocation()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        setUpConstraints()
        
    }
    
    //MARK: - SetUp Constraints
    private func setUpConstraints() {
        
        stackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 65.0).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 70.0).isActive = true
        
        locationLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        summaryLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        summaryLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor).isActive = true
        
        headerView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        headerView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        headerView.topAnchor.constraint(equalTo: stackView.bottomAnchor).isActive = true
        headerView.addConstraint(headerViewHeight)
        
        temperatureLabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 10.0).isActive = true
        temperatureLabel.heightAnchor.constraint(equalToConstant: 100.0).isActive = true
        temperatureLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 10.0).isActive = true
        temperatureLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor).isActive = true
        
        highAndLowLabel.topAnchor.constraint(equalTo: temperatureLabel.bottomAnchor, constant: 4.0).isActive = true
        highAndLowLabel.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
        highAndLowLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor).isActive = true
        highAndLowLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor).isActive = true
        
        tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor).isActive = true
        
    }
    
    //MARK: - Private methods
    private func setLablesAlpha(_ percent: CGFloat) {
        temperatureLabel.alpha = percent
        highAndLowLabel.alpha = percent
    }
}


//MARK: - TableView Delegate and DataSource Methods
extension WeatherViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dailyModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(
            withIdentifier: DailyTableViewCell.identifier, for: indexPath) as! DailyTableViewCell
        
        cell.configure(with: dailyModels[indexPath.row])
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        let headerView = HeaderView(frame: CGRect(x: 0,
                                                  y: 0,
                                                  width: view.frame.size.width,
                                                  height: 105))
        
        headerView.configure(with: hourlyModels)
        
        headerView.addSubview(createSeparateLine(x: 0, y: 0, width: view.frame.size.width, height: 1.0))
        headerView.addSubview(createSeparateLine(x: 0, y: 105, width: view.frame.size.width, height: 1.0))
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 105
    }
    
}

//MARK: - ScrollView Delegate Methods
extension WeatherViewController {
    
    func canAnimateHeader (_ scrollView: UIScrollView) -> Bool {
        let scrollViewMaxHeight = scrollView.frame.height + self.headerViewHeight.constant - minHeaderHeight
        return scrollView.contentSize.height > scrollViewMaxHeight
    }
    
    func setScrollPosition() {
        self.tableView.contentOffset = CGPoint(x:0, y: 0)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {

        let scrollDiff = (scrollView.contentOffset.y - previousScrollOffset)

        let isScrollingDown = scrollDiff > 0

        if canAnimateHeader(scrollView) {
            let currentHeaderHeight = headerViewHeight.constant
            let collapsePercent = currentHeaderHeight / maxHeaderHeight
            
            let newHeaderHeight: CGFloat
            if isScrollingDown {
                newHeaderHeight = max(minHeaderHeight, headerViewHeight.constant - abs(scrollDiff))
            } else {
                newHeaderHeight = min(maxHeaderHeight, headerViewHeight.constant + abs(scrollDiff))
            }
            
            setLablesAlpha(collapsePercent)
            if newHeaderHeight != headerViewHeight.constant {
                headerViewHeight.constant = newHeaderHeight
                setScrollPosition()
                previousScrollOffset = scrollView.contentOffset.y
            }
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        self.scrollViewDidStopScrolling()
    }

    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if !decelerate {
            self.scrollViewDidStopScrolling()
        }
    }

    func scrollViewDidStopScrolling() {

        if self.headerViewHeight.constant > 180  {
            headerViewHeight.constant = maxHeaderHeight
        } else {
            headerViewHeight.constant = minHeaderHeight
        }
        
        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
        self.view.layoutIfNeeded()
        }, completion: nil)
    }
}

//MARK: - Update Weather
extension WeatherViewController: WeatherManagerDelegate {    
    
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: Weather) {
        
        DispatchQueue.main.async {
            
            self.dailyModels = weather.daily.data
            self.currentWeather = weather.currently

            for index in 0...24 {
                self.hourlyModels.append(weather.hourly.data[index])
            }

            self.locationLabel.text = Converters.removeUnusedTextAndCharacters(weather.timezone)
            self.summaryLabel.text = weather.currently.summary

            self.temperatureLabel.text = "\(Converters.convertToCelsius(self.currentWeather!.temperature))°"
            self.highAndLowLabel.text = "H:\(Converters.convertToCelsius(self.dailyModels[0].temperatureHigh))°  L:\(Converters.convertToCelsius(self.dailyModels[0].temperatureLow))°"

            self.tableView.reloadData()
            self.tableView.tableFooterView = self.createTableFooter()
            
        }
    }
    
    func didRecieveError(_ error: String) {
        let alert = UIAlertController(title: "Error❗️",
                                      message: "\(error)",
                                      preferredStyle: .alert)
        let dismissAction = UIAlertAction(title: "Dismiss",
                                          style: .cancel,
                                          handler: nil)
        
        alert.addAction(dismissAction)
        present(alert, animated: true)
    }
}

