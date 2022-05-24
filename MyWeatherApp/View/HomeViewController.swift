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
    @IBOutlet private weak var cityName: UILabel!
    @IBOutlet private weak var cityTemperature: UILabel!
    @IBOutlet private weak var iconImage: UIImageView!
    @IBOutlet private weak var weatherDescription: UILabel!
    @IBOutlet private weak var maxTemp: UILabel!
    @IBOutlet private weak var minTemp: UILabel!
    @IBOutlet private weak var sunRise: UILabel!
    @IBOutlet private weak var sunSet: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherViewModel = WeatherViewModel(delegate: self)
        weatherViewModel?.fetchData(text: "London")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
    
    @IBAction func getWeatherData(_ sender: Any) {
        weatherViewModel?.fetchData(text: locationName.text ?? "London")
    }
}

extension HomeViewController: WeatherViewProtocol{
    func displayError(_ message: String) {
        DispatchQueue.main.async {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let doneButton = UIAlertAction(title: "Done", style: .default, handler: nil)
        alert.addAction(doneButton)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func refreshUI() {
        DispatchQueue.main.async {
            self.cityName.text = self.weatherViewModel?.cityName
            self.cityTemperature.text = (self.weatherViewModel?.temparature.description ?? "") + "°"
            let imageURL = self.weatherViewModel?.getIconUrl()
            ImageDownloader.shared.getImage(url: imageURL ?? "") { [weak self] data in
                DispatchQueue.main.async {
                    self?.iconImage.image = UIImage(data: data)
                }
            }
            self.weatherDescription.text = self.weatherViewModel?.description.description
            self.maxTemp.text = "High: " + (self.weatherViewModel?.maxTemp.description ?? "") + "°"
            self.minTemp.text = "Low: " + (self.weatherViewModel?.minTemp.description ?? "") + "°"
            
            self.sunRise.text = self.weatherViewModel?.sunrise
            self.sunSet.text = self.weatherViewModel?.sunset
        }

    }

}
