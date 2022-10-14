//
//  WeatherRepository.swift
//  Weather
//
//  Created by vishal on 10/11/22.
//

import NetworkProvider
import Foundation
import RealmSwift

protocol WeatherRepositoryProtocol {
    typealias WeatherResultHandler = (Result<Weathers, Error>) -> Void
    func getWeatherReport(by city: String, completion: @escaping WeatherResultHandler)
}

struct WeatherRepository: WeatherRepositoryProtocol {
    
    private var networkProvider: NetworkProviderProtocol
    private let databaseProviderProtocol: DatabaseProviderProtocol
    private let rechabilityProvidersProtocol: RechabilityProvidersProtocol
    
    init(networkProvider: NetworkProviderProtocol = NetworkProvider(),
         databaseProviderProtocol: DatabaseProviderProtocol = RealmDatabaseProvider(),
         rechabilityProvidersProtocol: RechabilityProvidersProtocol = RechabilityProviders()) {
        self.networkProvider = networkProvider
        self.databaseProviderProtocol = databaseProviderProtocol
        self.rechabilityProvidersProtocol = rechabilityProvidersProtocol
    }
    
    func getWeatherReport(by city: String, completion: @escaping WeatherResultHandler) {
        let weatherService = WeatherService(city: city)
        getWeatherReport(service: weatherService, completion: completion)
    }
}

private extension WeatherRepository {
    func getWeatherReport(service: NetworkService, completion: @escaping WeatherResultHandler) {
        let report = getWeatherReport()
        if rechabilityProvidersProtocol.checkInternetAvailabel() && report == nil {
            networkProvider.request(dataType: Weathers.self, service: service, onQueue: .main) { results in
                do {
                    let result = try results.get()
                    try saveData(weathers: result)
                    completion(.success(result))
                } catch {
                    completion(.failure(error))
                }
            }
        } else {
            guard let report = report else {
                completion(.failure(DatabaseError.nodata))
                return
            }
            completion(.success(report))
        }
    }
    
    func getWeatherReport() -> Weathers? {
        databaseProviderProtocol.fetch(Weathers.self) as? Weathers
    }
    
    func saveData(weathers: Weathers) throws {
        try databaseProviderProtocol.create(weathers)
        print("Data Stored")
    }
}
