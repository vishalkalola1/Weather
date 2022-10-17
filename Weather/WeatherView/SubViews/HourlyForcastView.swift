//
//  HourlyForecastView.swift
//  Weather
//
//  Created by vishal on 10/15/22.
//

import SwiftUI

struct HourlyForecastView: View {
    
    let dailyForecast: [DateList]
    let selected: (DateList) -> Void
    
    let columns = [
        GridItem(.adaptive(minimum: 90))
    ]
    
    var body: some View {
        VStack{
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: columns) {
                    ForEach(dailyForecast, id: \.self) { hourForecast in
                        VStack {
                            Text(hourForecast.date ?? Date(), style: .time)
                                .font(.system(size: 13))
                            ImageView(url: hourForecast.weatherInfo?.iconURL)
                                .frame(width: 40, height: 40)
                            Text(hourForecast.main?.temp?.temperature ?? "")
                                .font(.system(size: 13, weight: .bold))
                        }
                        .padding(10)
                        .background(Color.white.opacity(0.4))
                        .cornerRadius(10)
                        .onTapGesture {
                            selected(hourForecast)
                        }
                    }
                }
            }
            .frame(height: 120)
        }
    }
}
