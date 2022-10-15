//
//  HourlyForcastView.swift
//  Weather
//
//  Created by vishal on 10/15/22.
//

import SwiftUI

struct HourlyForcastView: View {
    
    let dailyForcast: [DateList]
    let selected: (DateList) -> Void
    
    let columns = [
        GridItem(.adaptive(minimum: 90))
    ]
    
    var body: some View {
        VStack{
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: columns) {
                    ForEach(dailyForcast, id: \.self) { hourForcast in
                        VStack {
                            Spacer().frame(height: 10)
                            Text(hourForcast.date ?? Date(), style: .time)
                            ImageView(url: hourForcast.weatherInfo?.iconURL)
                                .frame(width: 40, height: 40)
                            Text(hourForcast.main?.temp?.temprature ?? "")
                                .bold()
                        }
                        .padding(10)
                        .background(Color.white.opacity(0.4))
                        .cornerRadius(10)
                        .onTapGesture {
                            selected(hourForcast)
                        }
                    }
                }
            }
            .frame(height: 150)
        }
    }
}
