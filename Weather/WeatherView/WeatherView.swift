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
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text(viewModel.weatherReport?.city.name ?? "")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
