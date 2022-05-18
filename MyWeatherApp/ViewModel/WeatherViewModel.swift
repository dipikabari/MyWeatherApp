//
//  WeatherViewModel.swift
//  MyWeatherApp
//
//  Created by Dipika Bari on 18/05/2022.
//

import Foundation
import UIKit

protocol WeatherViewProtocol: AnyObject {
    func displayError(_ message: String)
    func refreshUI()
}

final class WeatherViewModel {

    private var weatherArray = [Weather]()
    private let networkManager:Networkable
    private var delegate: WeatherViewProtocol?
    private var iconArray = [String:Data]()
    init(delegate: WeatherViewProtocol, networkManager:Networkable = NetworkManager()){
        self.delegate = delegate
        self.networkManager = networkManager
    }
    
    var cityName = ""
    var temparature = 0.0
    
    var iconImageId = ""
    var iconImage = UIImage()

    
    /* get response from api into your defined array*/
    func fetchData(text: String) {
          let location = text.replacingOccurrences(of: " ", with: "%20")
         
        self.networkManager.fetchData(text: location) { [weak self] response, error in
              
              guard let response = response , error == nil else {
                  self?.delegate?.displayError("Failed to Search, Pls try again!")
                  return
              }
            
              self?.weatherArray = response.weather
             
              self?.cityName = response.name
              self?.temparature = response.main.temp
              self?.iconImageId = self?.weatherArray[0].icon ?? ""
              
            
              print(response.sys.country)
              print(self?.cityName)
              print(self?.temparature)
              print(self?.iconImageId)

              print(self?.weatherArray[0].description)
              print(self?.weatherArray[0].main)

                            
              DispatchQueue.main.async {
                  self?.delegate?.refreshUI()
              }
          }
       }
    
    func getIconUrl() -> String {
        let urlStr = self.networkManager.getIconUrl(iconId: iconImageId)
        return urlStr
    }
        
}
