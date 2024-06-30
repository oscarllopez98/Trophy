//
//  EnvironmentVariableManagerTests.swift
//  TrophyTests
//
//  Created by Oscar Lopez on 6/28/24.
//

import XCTest
@testable import Trophy

final class EnvironmentVariableManagerTests: XCTestCase {
    
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
    
    func testGetEnvironmentVariable() {
        print(getEnvironmentVariable("TEST")!)
    }
    
    func testGetEnvironmentVariableInvokePathPUTUserExercise_GPT() {
        print(getEnvironmentVariable("TROPHY_INVOKE_PATH_PUT_USER_EXERCISE_GPT_DEV")!)
    }
    
    func testFormatGetEnvironmentVariableInvokePathGETUserExercise() {
        let userId = "1234567890"
        let exerciseId = "9876543210"
        let pathTemplate = getEnvironmentVariable("TROPHY_INVOKE_PATH_GET_USER_EXERCISE_DEV")!
        var path = pathTemplate.replacingOccurrences(of: "\\(userId)", with: userId)
        path = path.replacingOccurrences(of: "\\(exerciseId)", with: exerciseId)
        print(path)
        XCTAssert(path.contains(userId))
        XCTAssert(path.contains(exerciseId))
    }
    
    func testFormatGetEnvironmentVariableInvokePathGETUserExercises() {
        let userId = "1234567890"
        let pathTemplate = getEnvironmentVariable("TROPHY_INVOKE_PATH_GET_USER_EXERCISES_DEV")!
        let path = pathTemplate.replacingOccurrences(of: "\\(userId)", with: userId)
        print(path)
        XCTAssert(path.contains(userId))
    }
    
    func testFormatGetEnvironmentVariableInvokePathPUTUserExercise() {
        let userId = "1234567890"
        let pathTemplate = getEnvironmentVariable("TROPHY_INVOKE_PATH_PUT_USER_EXERCISE_DEV")!
        let path = pathTemplate.replacingOccurrences(of: "\\(userId)", with: userId)
        print(path)
        XCTAssert(path.contains(userId))
    }
    
    func testFormatGetEnvironmentVariableInvokePathPUTUserExerciseWithExerciseId() {
        let userId = "1234567890"
        let exerciseId = "9876543210"
        let pathTemplate = getEnvironmentVariable("TROPHY_INVOKE_PATH_PUT_USER_EXERCISE_WITH_EXERCISE_ID_DEV")!
        var path = pathTemplate.replacingOccurrences(of: "\\(userId)", with: userId)
        path = path.replacingOccurrences(of: "\\(exerciseId)", with: exerciseId)
        print(path)
        XCTAssert(path.contains(userId))
        XCTAssert(path.contains(exerciseId))
    }
    
    func testFormatGetEnvironmentVariableInvokePathPUTUserExercise_GPT() {
        let userId = "1234567890"
        let pathTemplate = getEnvironmentVariable("TROPHY_INVOKE_PATH_PUT_USER_EXERCISE_GPT_DEV")!
        let path = pathTemplate.replacingOccurrences(of: "\\(userId)", with: userId)
        print(path)
        XCTAssert(path.contains(userId))
    }
    

}
