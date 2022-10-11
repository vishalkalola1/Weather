//
//  Weathers.swift
//  Weather
//
//  Created by vishal on 10/11/22.
//

import Foundation

struct Weathers: Codable {
    let cod: String?
    let message: Int?
    let cnt: Int?
    let dates: [DateList]?
    let city: City?
    
    enum CodingKeys: String, CodingKey {
        case cod, message, cnt, city
        case dates = "list"
    }
}

// MARK: - City
struct City: Codable {
    let id: Int?
    let name: String?
    let coordinate: Coordinate?
    let country: String?
    let population: Int?
    let timezone: Int?
    let sunrise: Int?
    let sunset: Int?
    
    enum CodingKeys: String, CodingKey {
        case id, name, country, population, timezone, sunrise, sunset
        case coordinate = "coord"
    }
}

// MARK: - Coord
struct Coordinate: Codable {
    let lat: Double?
    let long: Double?
    
    enum CodingKeys: String, CodingKey {
        case lat
        case long = "lon"
    }
}

// MARK: - List
struct DateList: Codable {
    let timestamp: Int?
    let main: Main?
    let weather: [Weather]?
    let clouds: Clouds?
    let wind: Wind?
    let visibility: Int?
    let pop: Double?
    let sys: System?
    let dt: String?
    
    var date: Date? {
        guard let timestamp = timestamp else { return nil }
        return Date(timeIntervalSince1970: Double(timestamp)).startOfDay
    }
    
    enum CodingKeys: String, CodingKey {
        case main, weather, clouds, wind, visibility, pop, sys
        case timestamp = "dt"
        case dt = "dtTxt"
    }
}

// MARK: - Clouds
struct Clouds: Codable {
    let all: Int?
}

// MARK: - Main
struct Main: Codable {
    let temp: Double?
    let feelsLike: Double?
    let tempMin: Double?
    let tempMax: Double?
    let pressure: Int?
    let seaLevel: Int?
    let grndLevel: Int?
    let humidity: Int?
    let tempKf: Double?

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
        case humidity
        case tempKf = "temp_kf"
    }
}

// MARK: - Sys
struct System: Codable {
    let pod: String?
}

// MARK: - Weather
struct Weather: Codable {
    let id: Int?
    let main: String?
    let details: String?
    let icon: String?

    enum CodingKeys: String, CodingKey {
        case id, main
        case details = "description"
        case icon
    }
}

// MARK: - Wind
struct Wind: Codable {
    let speed: Double?
    let deg: Int?
    let gust: Double?
}


extension Date {
    var startOfDay: Date {
        return Calendar.current.startOfDay(for: self)
    }
}
