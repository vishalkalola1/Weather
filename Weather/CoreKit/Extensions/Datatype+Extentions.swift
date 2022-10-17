//
//  Datatype+Extentions.swift
//  Weather
//
//  Created by vishal on 10/17/22.
//

import Foundation

extension Int {
    var percentage: String {
        String(format: "%d %%", self)
    }
    
    var toString: String {
        String(self)
    }
}
extension Double {

    var speed: String {
        let measurementInKelvin = Measurement(value: self, unit: UnitSpeed.kilometersPerHour)
        return String(format: "%.1f km/h", measurementInKelvin.value)
    }

    var temperature: String {
        let measurementInKelvin = Measurement(value: self, unit: UnitTemperature.kelvin)
        return String(format: "%.1f\u{00B0}", measurementInKelvin.converted(to: .celsius).value)
    }
}
