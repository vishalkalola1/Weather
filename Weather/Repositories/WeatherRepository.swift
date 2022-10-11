//
//  WeatherRepository.swift
//  Weather
//
//  Created by vishal on 10/11/22.
//

import NetworkProvider
import Foundation

protocol WeatherRepositoryProtocol {
    typealias WeatherResultHandler = (Result<Weathers?, Error>) -> Void
    func getWeatherReport(by city: String, completion: @escaping WeatherResultHandler)
}

struct WeatherRepository: WeatherRepositoryProtocol {
    
    private var networkProvider: NetworkProviderProtocol
    
    init(networkProvider: NetworkProviderProtocol = NetworkProvider()) {
        self.networkProvider = networkProvider
    }
    
    func getWeatherReport(by city: String, completion: @escaping WeatherResultHandler) {
        let weatherService = WeatherService(city: city)
        getWeatherReport(service: weatherService, completion: completion)
    }
}

private extension WeatherRepository {
    func getWeatherReport(service: NetworkService, completion: @escaping WeatherResultHandler) {
        networkProvider.request(dataType: Weathers.self, service: service, onQueue: .main) { results in
            do {
                let result = try results.get()
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
}
