//
//  NetworkManager.swift
//  MyWeatherApp
//
//  Created by Dipika Bari on 18/05/2022.
//

import Foundation

protocol Networkable {
    func fetchData(text:String, completion: @escaping (WeatherResponse?, Error?) -> Void)
}

class NetworkManager: Networkable {
    
func fetchData(text:String, completion: @escaping (WeatherResponse?, Error?) -> Void){
   
    let weatherUrl = "https://api.openweathermap.org/data/2.5/weather?q=\(text)&APPID=75a0763453e68f736f9711eff8b97517&units=metric"
   
    print(weatherUrl)
    
    guard let url = URL(string: weatherUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { data, urlResponse, error in
            guard let httpResponse = urlResponse as? HTTPURLResponse else {
                completion(nil, ServiceError.requestFailed)
                return
            }

            if httpResponse.statusCode == 200 {
                if let data =  data{
                    do {
                        let result: WeatherResponse = try JSONDecoder().decode(WeatherResponse.self, from: data)
                        completion(result, nil)
                    }catch _ {
                        completion(nil, ServiceError.jsonConversionFailed)
                    }
                }else {
                    completion(nil, ServiceError.dataNotFound)
                }
            }else{
                completion(nil, ServiceError.responseUnsuccessful)
            }
        }
        .resume()
    }

}
