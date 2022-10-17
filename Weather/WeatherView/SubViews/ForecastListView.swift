//
//  ForecastListView.swift
//  Weather
//
//  Created by vishal on 10/15/22.
//

import SwiftUI

struct ForecastListView: View {
    
    let forecasts: [Forecast]
    let selected: ([DateList]) -> Void
    
    init(forecasts: [Forecast], selected: @escaping ([DateList]) -> Void) {
        self.forecasts = forecasts
        self.selected = selected
    }
    
    var body: some View {
        VStack(spacing: 3) {
            Text("Next 7 days")
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .font(.system(size: 20, weight: .bold))
            List {
                ForEach(forecasts, id: \.self) { forecast in
                    ForecastListRow(forecast: forecast)
                        .onTapGesture {
                            selected(forecast.values)
                        }
                }
                .listRowBackground(Color.clear)
                .listRowSeparator(.hidden)
                .listRowInsets(EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0))
            }
            .listStyle(.plain)
            .scrollContentBackground(.hidden)
        }
    }
}


struct ForecastListRow: View {
    
    let forecast: Forecast
    
    var body: some View {
        HStack(spacing: 20) {
            Text(forecast.date, style: .date)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .font(.system(size: 13))
            Text(forecast.values.first?.main?.tempMin?.temperature ?? "")
                .bold()
                .font(.system(size: 13))
            Text(forecast.values.last?.main?.tempMax?.temperature ?? "")
                .bold()
                .font(.system(size: 13))
            ImageView(url: forecast.values.first?.weatherInfo?.iconURL)
                .frame(width: 40, height: 40)
                .shadow(color: Color.init(uiColor: .cyan).opacity(0.1), radius: 5, x: 0, y: 5)
        }
        .padding(.horizontal, 20)
        .frame(height: 70)
        .background(Color.white.opacity(0.4))
        .cornerRadius(10)
    }
}
