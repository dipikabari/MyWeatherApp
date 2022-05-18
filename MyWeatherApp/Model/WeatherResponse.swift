//
//  WeatherResponse.swift
//  MyWeatherApp
//
//  Created by Dipika Bari on 18/05/2022.
//

import Foundation

struct WeatherResponse: Decodable {
        let coord: Coord
        let weather: [Weather]
        let base: String
        let main: Main
        let visibility: Int
        let wind: Wind
        let clouds: Clouds
        let dt: Int
        let sys: Sys
        let timezone, id: Int
        let name: String
        let cod: Int
}

// MARK: - Coord
struct Coord: Decodable  {
    let lon, lat: Double
}

// MARK: - Weather
struct Weather: Decodable  {
    let id: Int
    let main, description, icon: String
}

// MARK: - Main
struct Main: Decodable  {
    let temp, feels_like, temp_min, temp_max: Double
    let pressure, humidity: Int
}

// MARK: - Clouds
struct Clouds: Decodable  {
    let all: Int
}


// MARK: - Sys
struct Sys: Decodable  {
    let type, id: Int
    let country: String
    let sunrise, sunset: Int
}

// MARK: - Wind
struct Wind: Decodable  {
    let speed: Double
    let deg: Int
}
