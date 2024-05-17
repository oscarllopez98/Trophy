//
//  IntensityAttributeConverterTests.swift
//  TrophyTests
//
//  Created by Oscar Lopez on 5/17/24.
//

import XCTest
@testable import Trophy

final class IntensityAttributeConverterTests: XCTestCase {

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
    
    func testIntensityAttributeConverterInstantiates() throws {
        let converter = IntensityAttributeConverter()
        XCTAssertNotNil(converter)
    }
    
    func testIntensityAttributeConverterInstantiatesConverts() throws {
        let converter = IntensityAttributeConverter()
        let attributeDict = converter.convertToAPIFormat(IntensityAttribute(value: .med))
    }
    
    func testIntensityAttributeConverterInstantiatesEquals() throws {
        let converter = IntensityAttributeConverter()
        let attributeDict = converter.convertToAPIFormat(IntensityAttribute(value: .med))
        
        // Access the values in the returned dictionary
        if let value = attributeDict["value"] as? AttributeValue {
            print("Value: \(value.stringValue)")
            XCTAssertEqual(IntensityAttribute(value: .med).value.stringValue, value.stringValue)
        } else {
            XCTFail("value not found in converted dictionary.")
        }
    }

}
