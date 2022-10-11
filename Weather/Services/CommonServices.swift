//
//  CommonServices.swift
//  Weather
//
//  Created by vishal on 10/11/22.
//

import Foundation

enum CommonServices {
    
    static var baseURL: String {
        "https://api.openweathermap.org/data/\(version)/"
    }

    static var version: String {
        "2.5"
    }
    
    static var appID: String {
        "2566ba777fedc82ccb90a87bff069f5c"
    }
}
