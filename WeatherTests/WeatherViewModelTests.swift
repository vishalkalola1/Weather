//
//  WeatherTests.swift
//  WeatherTests
//
//  Created by vishal on 10/15/22.
//

import XCTest
@testable import Weather

final class WeatherViewModelTests: XCTestCase {

    private var viewModel: WeatherViewModel!
    private var mockRepositories: MockWeatherRepositories!
    
    override func setUp() {
        super.setUp()
        mockRepositories = MockWeatherRepositories()
        viewModel = WeatherViewModel(weatherRepository: mockRepositories)
    }
    
    override func tearDown() {
        super.tearDown()
        viewModel = nil
    }
    
    func testWeatherReport() {
        
        // When
        var actual: WeatherReport? = nil
        let expectation = self.expectation(description: "waiting validation")
        let cancellable = viewModel.$weatherReport.sink(receiveValue: { values in
            if let value = values {
                actual = value
                expectation.fulfill()
            }
        })
        
        // Then
        wait(for: [expectation], timeout: 10)
        cancellable.cancel()
        
        XCTAssertNotNil(actual)
    }
    
    func testDailyForecast() {
        // When
        var actual: [DateList]? = nil
        
        let expectation = self.expectation(description: "waiting validation")
        let cancellable = viewModel.$dailyForecast.sink(receiveValue: { values in
            if let value = values {
                actual = value
                expectation.fulfill()
            }
        })
        
        // Then
        wait(for: [expectation], timeout: 10)
        cancellable.cancel()
        
        XCTAssertNotNil(actual)
    }
    
    func testSelectedForecast() {
        // When
        var actual: DateList? = nil
        
        let expectation = self.expectation(description: "waiting validation")
        let cancellable = viewModel.$selectedForecast.sink(receiveValue: { values in
            if let value = values {
                actual = value
                expectation.fulfill()
            }
        })
        
        // Then
        wait(for: [expectation], timeout: 10)
        cancellable.cancel()
        
        XCTAssertNotNil(actual)
    }
}

