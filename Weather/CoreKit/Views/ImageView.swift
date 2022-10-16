//
//  ImageView.swift
//  Weather
//
//  Created by vishal on 10/11/22.
//

import SwiftUI

struct ImageView: View {
    
    let url: URL?
    
    var body: some View {
        AsyncImage(url: url) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
        } placeholder: {
            Image(systemName: "photo")
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
    }
}
