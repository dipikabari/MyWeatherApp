//
//  WeatherViewModel.swift
//  MyWeatherApp
//
//  Created by Dipika Bari on 18/05/2022.
//

import Foundation

protocol WeatherViewProtocol: AnyObject {
    func displayError(_ message: String)
    func refreshUI()
}

final class WeatherViewModel {

    private var weatherArray = [Weather]()
    private let networkManager:Networkable
    private var delegate: WeatherViewProtocol?
    
    init(delegate: WeatherViewProtocol, networkManager:Networkable = NetworkManager()){
        self.delegate = delegate
        self.networkManager = networkManager
    }
    
    /* get response from api into your defined array*/
    func fetchData(text: String) {
          let location = text.replacingOccurrences(of: " ", with: "%20")
         
        self.networkManager.fetchData(text: location) { [weak self] response, error in
              
              guard let response = response , error == nil else {
                  self?.delegate?.displayError("Failed to Search, Pls try again!")
                  return
              }
            
              self?.weatherArray = response.weather
             
              print(response.sys.country)
              print(response.name)

              print(self?.weatherArray[0].description)
              print(self?.weatherArray[0].main)
              print(self?.weatherArray[0].icon)
                            
              DispatchQueue.main.async {
                  self?.delegate?.refreshUI()
              }
          }
       }
    
}
