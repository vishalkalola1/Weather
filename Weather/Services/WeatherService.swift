//
//  WeatherService.swift
//  Weather
//
//  Created by vishal on 10/11/22.
//

import NetworkProvider
import Foundation


struct WeatherService: NetworkService {
    
    var baseURL: String {
        CommonServices.baseURL
    }
    
    var method: HttpMethod {
        .get
    }
    
    var httpBody: Encodable? {
        nil
    }
    
    var headers: [String: String]? {
        nil
    }
    
    var queryParameters: [URLQueryItem]? {
        [URLQueryItem(name: "q", value: city),
         URLQueryItem(name: "appid", value: CommonServices.appID)]
    }
    
    var timeout: TimeInterval? {
        30
    }
    
    var path: String {
        "forecast"
    }
    
    private var city: String
    
    internal init(city: String) {
        self.city = city
    }
}
