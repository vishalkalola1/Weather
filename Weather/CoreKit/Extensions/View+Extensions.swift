//
//  View+Extensions.swift
//  Weather
//
//  Created by vishal on 10/11/22.
//


import SwiftUI

extension View {
    func errorAlert(error: Binding<Error?>) -> some View {
        return alert(isPresented: .constant(error.wrappedValue != nil)) {
            Alert(title: Text("Error"),
                  message:  Text((error.wrappedValue as? LocalizedError)?.errorDescription ?? ""))
        }
    }
}
