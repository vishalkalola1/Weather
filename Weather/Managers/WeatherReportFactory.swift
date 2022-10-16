//
//  ReportProviders.swift
//  Weather
//
//  Created by vishal on 10/15/22.
//

import Foundation

protocol WeatherReportFactoryProtocol {
    func genetateReport(_ city: City, dates: [DateList]) -> WeatherReport
}

struct WeatherReportFactory: WeatherReportFactoryProtocol {
    func genetateReport(_ city: City, dates: [DateList]) -> WeatherReport {
        let dict = Dictionary(grouping: dates, by: { $0.startDay })
        let forcasts = dict.map({ Forcast.init(date: $0.key, values: $0.value) }).sorted(by: { $0.date < $1.date })
        return .init(city: city, forcasts: forcasts)
    }
}
