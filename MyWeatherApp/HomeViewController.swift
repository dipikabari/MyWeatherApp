//
//  HomeViewController.swift
//  MyWeatherApp
//
//  Created by Dipika Bari on 18/05/2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    var weatherViewModel: WeatherViewModel?
    
    @IBOutlet private weak var locationName: UITextField!
    
    @IBOutlet private weak var searchBtn: UIButton!
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherViewModel = WeatherViewModel(delegate: self)
    }
    
    @IBAction func getWeatherData(_ sender: Any) {
        weatherViewModel?.fetchData(text: locationName.text ?? "London")
    }
    
}

extension HomeViewController: WeatherViewProtocol{
    func displayError(_ message: String) {
    
    }
    
    func refreshUI() {
    
    }

}
