//
//  ServiceError.swift
//  MyWeatherApp
//
//  Created by Dipika Bari on 18/05/2022.
//

import Foundation

enum ServiceError: Error {
    case requestFailed
    case dataNotFound
    case jsonParsingFailed
    case jsonConversionFailed
    case responseUnsuccessful
}
