//
//  RechabilityProviders.swift
//  Weather
//
//  Created by vishal on 10/14/22.
//

import Foundation
import Reachability

protocol RechabilityProvidersProtocol: AnyObject {
    func checkInternetAvailabel() -> Bool
}

class RechabilityProviders: RechabilityProvidersProtocol {
    
    private let reachability = try! Reachability()
    
    init() {
        reachability.whenReachable = { reachability in
            if reachability.connection == .wifi {
                print("Reachable via WiFi")
            } else {
                print("Reachable via Cellular")
            }
        }
        reachability.whenUnreachable = { _ in
            print("Not reachable")
        }
        
        do {
            try reachability.startNotifier()
        } catch {
            print("Unable to start notifier")
        }
    }
    
    func checkInternetAvailabel() -> Bool {
        reachability.connection != .unavailable
    }
}
