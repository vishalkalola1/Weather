//
//  WeatherViewModel.swift
//  Weather
//
//  Created by vishal on 10/11/22.
//

import Foundation
import Combine

protocol WeatherViewModelProtocol: ObservableObject {
    var dates: [DateList] { get }
}

final class WeatherViewModel: WeatherViewModelProtocol {
    
    @Published var dates: [DateList] = []
    @Published var error: Error?
    
    private let weatherRepository: WeatherRepositoryProtocol
    
    init(weatherRepository: WeatherRepositoryProtocol = WeatherRepository()) {
        self.weatherRepository = weatherRepository
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
                self.dates = results?.dates ?? []
            } catch {
                self.error = error
            }
        }
    }
}

