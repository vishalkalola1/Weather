//
//  DailyForecastView.swift
//  Weather
//
//  Created by vishal on 10/15/22.
//

import SwiftUI

struct DailyForecastView: View {
    
    let selectedForecast: DateList?
    let city: City?
    
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                Spacer()
                ImageView(url: selectedForecast?.weatherInfo?.iconURL)
                    .frame(width: 100, height: 100)
                    .background(Color.white.opacity(0.4))
                    .clipShape(Circle())
                Spacer()
                VStack(spacing: 5) {
                    Text((selectedForecast?.main?.temp?.temperature ?? "") + "C")
                        .font(.init(.system(size: 30, weight: .bold)))
                    Text(selectedForecast?.weatherInfo?.main ?? "")
                    Text((selectedForecast?.visibility?.toString ?? "") + " M")
                }
                Spacer()
                VStack(spacing: 5) {
                    Text(city?.name ?? "")
                        .font(.init(.system(size: 30, weight: .bold)))
                    Text(selectedForecast?.startDay ?? Date(), style: .date)
                        .foregroundColor(Color.gray)
                        .font(.init(.system(size: 15, weight: .regular)))
                }
                Spacer()
            }
        }
    }
}
