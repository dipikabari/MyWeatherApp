//
//  WeatherViewModelTests.swift
//  MyWeatherAppTests
//
//  Created by Dipika Bari on 24/05/2022.
//

import XCTest
@testable import MyWeatherApp

class WeatherViewModelTests: XCTestCase {
    var weatherViewModel: WeatherViewModel!
    
    override func setUpWithError() throws {
        let viewController = HomeViewController()
        let mockNetworkManager = MockNetworkManager()
        
        weatherViewModel = WeatherViewModel(delegate: viewController, networkManager: mockNetworkManager)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testFetchDataForLondonAPI_success() {
        weatherViewModel.fetchData(text: "londonAPI_success")
        
        XCTAssertEqual(weatherViewModel.cityName, "London,GB")
        XCTAssertEqual(weatherViewModel.iconImageId, "03d")
        XCTAssertEqual(weatherViewModel.getIconUrl(), "https://openweathermap.org/img/wn/03d@2x.png")
        XCTAssertEqual(weatherViewModel.temperature, 15.08)
        XCTAssertEqual(weatherViewModel.minTemp, 12.95)
        XCTAssertEqual(weatherViewModel.maxTemp, 17.36)
    }
    
}
