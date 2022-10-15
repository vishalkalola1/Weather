//
//  WeatherReport.swift
//  Weather
//
//  Created by vishal on 10/14/22.
//

import Foundation

struct WeatherReport {
    let city: City
    let forcasts: [Forcast]
    
    init(city: City, forcasts: [Forcast]) {
        self.city = city
        self.forcasts = forcasts
    }
}

struct Forcast: Hashable {
    let date: Date
    let values: [DateList]
}

