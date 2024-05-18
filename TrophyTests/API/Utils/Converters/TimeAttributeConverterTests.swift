//
//  TimeAttributeConverterTests.swift
//  TrophyTests
//
//  Created by Oscar Lopez on 5/17/24.
//

import XCTest
@testable import Trophy

final class TimeAttributeConverterTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testTimeAttributeConverterInstantiates() throws {
        let converter = TimeAttributeConverter()
        XCTAssertNotNil(converter)
    }
    
    func testTimeAttributeConverterInstantiatesConverts() throws {
        let converter = TimeAttributeConverter()
        let time = TimeInterval()
        let attributeDict = converter.convertToAPIFormat(TimeAttribute(time: time))
    }
    
    func testTimeAttributeConverterInstantiatesEquals() throws {
        let converter = TimeAttributeConverter()
        let time = TimeInterval(100)
        let attributeDict = converter.convertToAPIFormat(TimeAttribute(time: time))
        
        // Access the values in the returned dictionary
        if let value = attributeDict["value"] as? Int {
            print("Value: \(value)")
            XCTAssertEqual(Int(time), value)
        } else {
            XCTFail("value not found in converted dictionary.")
        }
    }

}
