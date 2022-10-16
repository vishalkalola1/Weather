//
//  MockWeatherRepositories.swift
//  WeatherTests
//
//  Created by vishal on 10/15/22.
//

import Foundation
@testable import Weather

class MockWeatherRepositories: WeatherRepositoryProtocol {
    func getWeatherReport(by city: String, completion: @escaping WeatherResultHandler) {
        guard let dict = TestUtils().loadData(fromFileName: "weather_forecast") else {
            completion(.failure(DatabaseError.nodata))
            return
        }
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
            // here "jsonData" is the dictionary encoded in JSON data

            let decoder = JSONDecoder()
            let weathers = try decoder.decode(Weathers.self, from: jsonData)
            completion(.success(weathers))
        } catch {
            completion(.failure(error))
        }
    }
}
