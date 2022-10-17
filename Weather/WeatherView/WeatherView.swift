//
//  WeatherView.swift
//  Weather
//
//  Created by vishal on 10/11/22.
//

import SwiftUI

struct WeatherView: View {
    
    @StateObject var viewModel = WeatherViewModel()
    
    var body: some View {
        VHStack {
            if viewModel.weatherReport != nil {
                VStack {
                    DailyForecastView(selectedForecast: viewModel.selectedForecast, city: viewModel.weatherReport?.city)
                    WeatherInfo(selectedForecast: viewModel.selectedForecast)
                    HourlyForecastView(dailyForecast: viewModel.dailyForecast ?? []) { selected in
                        viewModel.selectedForecast = selected
                    }
                }
                ForecastListView(forecasts: viewModel.weatherReport?.forecasts ?? []) { selected in
                    viewModel.dailyForecast = selected
                }
            } else {
                ProgressView()
                    .progressViewStyle(.circular)
            }
        }
        .padding()
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color("backgroundcolor"))
        .edgesIgnoringSafeArea(.bottom)
        .errorAlert(error: $viewModel.error)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
