//
//  ExerciseCardViewUnitTests.swift
//  TrophyTests
//
//  Created by Oscar Lopez on 3/4/24.
//

import XCTest
@testable import Trophy

final class ExerciseCardViewUnitTests: XCTestCase {

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
    
    //MARK: Initialization
    
    func testExerciseCardViewInitialization() {
        let cardView: ExerciseCardView = ExerciseCardView(viewModel: ExerciseViewModel.sample())
        XCTAssertNotNil(cardView)
        XCTAssertNotNil(cardView.maxFrameHeight)
        XCTAssertNotNil(cardView.maxFrameWidth)
        XCTAssertNotNil(cardView.controller)
        XCTAssertNotNil(cardView.workoutSymbol)
    }

}