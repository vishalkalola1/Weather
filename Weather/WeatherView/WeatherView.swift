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
            VStack {
                DailyForcastView(selectedForcast: viewModel.selectedForcast, city: viewModel.weatherReport?.city)
                WeatherInfo(selectedForcast: viewModel.selectedForcast)
                HourlyForcastView(dailyForcast: viewModel.dailyForcast ?? []) { selected in
                    viewModel.selectedForcast = selected
                }
            }
            ForcastListView(forcasts: viewModel.weatherReport?.forcasts ?? []) { selected in
                viewModel.dailyForcast = selected
            }
        }
        .padding()
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color("backgroundcolor"))
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
