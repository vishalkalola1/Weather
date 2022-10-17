//
//  Weathers.swift
//  Weather
//
//  Created by vishal on 10/11/22.
//

import Foundation
import RealmSwift

class Weathers: Object, Codable {
    @Persisted (primaryKey: true) var id: String = UUID().uuidString
    @Persisted var cod: String?
    @Persisted var message: Int?
    @Persisted var cnt: Int?
    @Persisted var dates: List<DateList>
    @Persisted var city: City?
    
    enum CodingKeys: String, CodingKey {
        case cod, message, cnt, city
        case dates = "list"
    }
}

// MARK: - City
class City: Object, Codable {
    @Persisted var id: Int?
    @Persisted var name: String?
    @Persisted var coordinate: Coordinate?
    @Persisted var country: String?
    @Persisted var population: Int?
    @Persisted var timezone: Int?
    @Persisted var sunrise: Int?
    @Persisted var sunset: Int?
    
    enum CodingKeys: String, CodingKey {
        case id, name, country, population, timezone, sunrise, sunset
        case coordinate = "coord"
    }
}

// MARK: - Coord
class Coordinate: Object, Codable {
    @Persisted var lat: Double?
    @Persisted var long: Double?
    
    enum CodingKeys: String, CodingKey {
        case lat
        case long = "lon"
    }
}

// MARK: - List
class DateList: Object, Codable {
    @Persisted var timestamp: Int?
    @Persisted var main: Main?
    @Persisted var weather: List<Weather>
    @Persisted var clouds: Clouds?
    @Persisted var wind: Wind?
    @Persisted var visibility: Int?
    @Persisted var pop: Double?
    @Persisted var sys: System?
    @Persisted var dt: String?
    
    enum CodingKeys: String, CodingKey {
        case main, weather, clouds, wind, visibility, pop, sys
        case timestamp = "dt"
        case dt = "dt_txt"
    }
    
    var weatherInfo: Weather? {
        weather.first
    }
    
    var startDay: Date {
        guard let date = date else { return Date() }
        let calendar = Calendar.current
        return calendar.startOfDay(for: date)
    }
    
    var date: Date? {
        guard let timestamp = timestamp else { return nil }
        return Date(timeIntervalSince1970: TimeInterval(timestamp))
    }
}

// MARK: - Clouds
class Clouds: Object, Codable {
    @Persisted var all: Int?
}

// MARK: - Main
class Main: Object, Codable {
    @Persisted var temp: Double?
    @Persisted var feelsLike: Double?
    @Persisted var tempMin: Double?
    @Persisted var tempMax: Double?
    @Persisted var pressure: Int?
    @Persisted var seaLevel: Int?
    @Persisted var grndLevel: Int?
    @Persisted var humidity: Int?
    @Persisted var tempKf: Double?

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
class System: Object, Codable {
    @Persisted var pod: String?
}

// MARK: - Weather
class Weather: Object, Codable {
    @Persisted var id: Int?
    @Persisted var main: String?
    @Persisted var details: String?
    @Persisted var icon: String?
    
    var iconURL: URL? {
        guard let icon = icon else { return nil }
        return URL(string: "https://openweathermap.org/img/wn/\(icon)@2x.png")
    }
    
    enum CodingKeys: String, CodingKey {
        case id, main
        case details = "description"
        case icon
    }
}

// MARK: - Wind
class Wind: Object, Codable {
    @Persisted var speed: Double?
    @Persisted var deg: Int?
    @Persisted var gust: Double?
}
