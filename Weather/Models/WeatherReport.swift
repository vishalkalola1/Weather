//
//  WeatherReport.swift
//  Weather
//
//  Created by vishal on 10/14/22.
//

import Foundation

public enum DatabaseError: Error {
    case nodata
    case insertFailed
    case duplicate
    case nodb
 }

extension DatabaseError: CustomStringConvertible {
    public var description: String {
        switch self {
            case .nodata:
                return "No data"
            case .insertFailed:
                return "Data does not synced"
            case .duplicate:
                return "Data already exist"
            case .nodb:
                return "Database operation failed"
        }
    }
}


protocol WeatherReportFactoryProtocol {
    func genetateReport(_ city: City, dates: [DateList]) -> WeatherReport
}

struct WeatherReportFactory: WeatherReportFactoryProtocol {
    func genetateReport(_ city: City, dates: [DateList]) -> WeatherReport {
        let dict = Dictionary(grouping: dates, by: { $0.key })
        let forcasts = dict.map({ Forcast.init(date: $0.key, values: $0.value) })
        return .init(city: city, forcasts: forcasts)
    }
}

struct WeatherReport {
    let city: City
    let forcasts: [Forcast]
    
    init(city: City, forcasts: [Forcast]) {
        self.city = city
        self.forcasts = forcasts
    }
}

struct Forcast {
    let date: String
    let values: [DateList]
}

