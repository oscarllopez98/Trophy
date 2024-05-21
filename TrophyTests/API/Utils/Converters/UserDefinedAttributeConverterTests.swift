//
//  UserDefinedAttributeConverterTests.swift
//  TrophyTests
//
//  Created by Oscar Lopez on 5/17/24.
//

import XCTest
@testable import Trophy

final class UserDefinedAttributeConverterTests: XCTestCase {

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
    
    func testUserDefinedAttributeConverterInstantiates() throws {
        let converter = UserDefinedAttributeConverter()
        XCTAssertNotNil(converter)
    }
    
    func testUserDefinedAttributeConverterInstantiatesConverts() throws {
        let converter = UserDefinedAttributeConverter()
        let name = "My name"
        let value = "Some value"
        let unit = DistanceUnit(distanceSymbol: .ft)
        let attributeDict = converter.convertToAPIFormat(UserDefinedAttribute(name: name, value: value, unit: unit))
    }
    
    func testWeightAttributeConverterInstantiatesEquals() throws {
        let converter = UserDefinedAttributeConverter()
        let name = "My name"
        let value = LevelAttribute(value: .eight).value
        let unit = DistanceUnit(distanceSymbol: .ft)
        let attributeDict = converter.convertToAPIFormat(
            UserDefinedAttribute(name: name, value: value.stringValue, unit: unit))
        
        // Access the values in the returned dictionary
        if let name = attributeDict["name"] as? String {
            print("Name: \(name)")
            XCTAssertEqual(
                UserDefinedAttribute(name: name, value: value.stringValue, unit: unit).name,
                name)
        } else {
            XCTFail("name not found in converted dictionary.")
        }
        
        if let value = attributeDict["value"] as? AttributeValue {
            print("Value: \(value.stringValue)")
            XCTAssertEqual(
                UserDefinedAttribute(name: name, value: value.stringValue, unit: unit).value.stringValue,
                value.stringValue)
        } else {
            XCTFail("value not found in converted dictionary.")
        }
        if let unit = attributeDict["unit"] as? String {
            print("Unit: \(unit)") // Output: Unit: km
            XCTAssertEqual(
                UserDefinedAttribute(name: name,
                                     value: value.stringValue,
                                     unit: DistanceUnit(distanceSymbol: .ft))
                .unit?.symbolAsString, String(unit))
        } else {
            XCTFail("unit not found in converted dictionary.")
        }
    }

}
