//
//  WeatherViewModel.swift
//  Weather
//
//  Created by vishal on 10/11/22.
//

import Foundation
import Combine

protocol WeatherViewModelProtocol: ObservableObject {
    var weatherReport: WeatherReport? { get }
    var error: Error? { get }
}

final class WeatherViewModel: WeatherViewModelProtocol {
    
    @Published var weatherReport: WeatherReport? = nil
    @Published var error: Error?
    
    private let weatherRepository: WeatherRepositoryProtocol
    private let weatherReportFactoryProtocol: WeatherReportFactoryProtocol
    
    init(weatherRepository: WeatherRepositoryProtocol = WeatherRepository(),
         weatherReportFactoryProtocol: WeatherReportFactoryProtocol = WeatherReportFactory()) {
        self.weatherRepository = weatherRepository
        self.weatherReportFactoryProtocol = weatherReportFactoryProtocol
        fetchWeatherReports()
    }
}

private extension WeatherViewModel {
    
    /// fetch weather reports
    func fetchWeatherReports(by city: String = "paris") {
        weatherRepository.getWeatherReport(by: city) { [weak self] results in
            guard let self = self else { return }
            do {
                let results = try results.get()
                guard let city = results.city else { return }
                self.weatherReport = self.weatherReportFactoryProtocol.genetateReport(city, dates: Array(results.dates))
            } catch {
                self.error = error
            }
        }
    }
}

