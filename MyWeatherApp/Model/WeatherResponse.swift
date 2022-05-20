//
//  WeatherResponse.swift
//  MyWeatherApp
//
//  Created by Dipika Bari on 18/05/2022.
//

import Foundation

struct WeatherResponse: Decodable {
        
        let weather: [Weather]
        let base: String
        let main: Main
        let sys: Sys
        let timezone: Int
        let name: String
}

// MARK: - Weather
struct Weather: Decodable  {
    let id: Int
    let main, description, icon: String
}

// MARK: - Main
struct Main: Decodable  {
    let temp, feels_like, temp_min, temp_max: Double
}


// MARK: - Sys
struct Sys: Decodable  {
    let type, id: Int
    let country: String
    let sunrise, sunset: Int
}


