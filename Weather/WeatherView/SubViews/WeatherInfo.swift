//
//  WeatherInfo.swift
//  Weather
//
//  Created by vishal on 10/15/22.
//

import SwiftUI

struct WeatherInfo: View {
    
    let selectedForecast: DateList?
    
    var body: some View {
        HStack {
            WeatherInfoRow(image: "cloud", name: "Clouds", value: selectedForecast?.clouds?.all?.percentage ?? "")
            WeatherInfoRow(image: "humidity", name: "Humidity", value: selectedForecast?.main?.humidity?.percentage ?? "")
            WeatherInfoRow(image: "wind", name: "Wind", value: selectedForecast?.wind?.speed?.speed ?? "")
        }
    }
}

struct WeatherInfoRow: View {
    
    let image: String
    let name: String
    let value: String
    
    var body: some View {
        HStack {
            Image(image)
                .resizable()
                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                .frame(width: 40, height: 40)
                .aspectRatio(contentMode: .fit)
            VStack(spacing: 5) {
                Text(name)
                    .font(.system(size: 13))
                Text(value)
                    .font(.system(size: 13))
            }
        }
        .frame(height: 70)
        .frame(minWidth: 0, maxWidth: .infinity)
        .background(Color.white.opacity(0.4))
        .cornerRadius(10)
    }
}
