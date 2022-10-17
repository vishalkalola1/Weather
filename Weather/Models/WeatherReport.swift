//
//  WeatherReport.swift
//  Weather
//
//  Created by vishal on 10/14/22.
//

import Foundation

struct WeatherReport {
    let city: City
    let forecasts: [Forecast]
    
    init(city: City, forecasts: [Forecast]) {
        self.city = city
        self.forecasts = forecasts
    }
}

struct Forecast: Hashable {
    let date: Date
    let values: [DateList]
}

