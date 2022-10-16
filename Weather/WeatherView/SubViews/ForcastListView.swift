//
//  ForcastListView.swift
//  Weather
//
//  Created by vishal on 10/15/22.
//

import SwiftUI

struct ForcastListView: View {
    
    let forcasts: [Forcast]
    let selected: ([DateList]) -> Void
    
    init(forcasts: [Forcast], selected: @escaping ([DateList]) -> Void) {
        self.forcasts = forcasts
        self.selected = selected
    }
    
    var body: some View {
        VStack(spacing: 3) {
            Text("Next 7 days")
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .font(.system(size: 20, weight: .bold))
            List {
                ForEach(forcasts, id: \.self) { forcast in
                    ForcastListRow(forcast: forcast)
                        .onTapGesture {
                            selected(forcast.values)
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


struct ForcastListRow: View {
    
    let forcast: Forcast
    
    var body: some View {
        HStack(spacing: 20) {
            Text(forcast.date, style: .date)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .font(.system(size: 13))
            Text(forcast.values.first?.main?.tempMin?.temprature ?? "")
                .bold()
                .font(.system(size: 13))
            Text(forcast.values.last?.main?.tempMax?.temprature ?? "")
                .bold()
                .font(.system(size: 13))
            ImageView(url: forcast.values.first?.weatherInfo?.iconURL)
                .frame(width: 40, height: 40)
                .shadow(color: Color.init(uiColor: .cyan).opacity(0.1), radius: 5, x: 0, y: 5)
        }
        .padding(.horizontal, 20)
        .frame(height: 70)
        .background(Color.white.opacity(0.4))
        .cornerRadius(10)
    }
}
