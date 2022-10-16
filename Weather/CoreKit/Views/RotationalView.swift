//
//  RotationalView.swift
//  Weather
//
//  Created by vishal on 10/15/22.
//

import SwiftUI

struct VHStack<Content>: View where Content: View {
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass

    private let content: Content
    
    init(@ViewBuilder _ content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        if (horizontalSizeClass == .regular && verticalSizeClass == .regular) || (horizontalSizeClass == .compact && verticalSizeClass == .regular) {
            VStack {
                content
            }
        } else {
            HStack(spacing: 10) {
                content
            }
        }
    }
}
