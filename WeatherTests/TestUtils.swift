//
//  TestUtils.swift
//  WeatherTests
//
//  Created by vishal on 10/15/22.
//

import Foundation

class TestUtils {
    
    func loadData(fromFileName: String) -> [String: Any]? {
        
        let testBundle = Bundle(for: type(of: self))
        guard let filePath = testBundle.path(forResource: fromFileName, ofType: "json") else {
            return nil
        }
        
        guard let data = NSData(contentsOfFile: filePath),
              let JSON = try? JSONSerialization.jsonObject(with: data as Data, options: []) as? [String: Any] else{
            return nil
        }
        
        return JSON
        
    }
}
