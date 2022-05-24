//
//  MockNetworkManager.swift
//  MyWeatherAppTests
//
//  Created by Dipika Bari on 24/05/2022.
//

import Foundation
@testable import MyWeatherApp


class MockNetworkManager: Networkable {
        
    func fetchData(text: String, completion: @escaping (WeatherResponse?, Error?) -> Void) {
        
        let bundle = Bundle(for:MockNetworkManager.self)
        
        guard let url = bundle.url(forResource:text, withExtension:"json"),
              let data = try? Data(contentsOf: url) else {
            return
        }
        
         do {
            let result: WeatherResponse = try JSONDecoder().decode(WeatherResponse.self, from: data)
            completion(result, nil)
        }catch let error {
            completion(nil, error)
        }
    }
    
    func getIconUrl(iconId: String) -> String {
       return "https://openweathermap.org/img/wn/\(iconId)@2x.png"
    }

}
