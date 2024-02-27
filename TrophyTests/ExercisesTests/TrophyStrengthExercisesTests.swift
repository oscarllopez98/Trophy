//
//  TrophyStrengthExercisesTests.swift
//  TrophyTests
//
//  Created by Oscar Lopez on 12/26/23.
//

import XCTest
@testable import Trophy

final class TrophyStrengthExercisesTests: XCTestCase {

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
    
    func testBenchPress() throws {
        //Setup
        let id = UUID()
        let sets = 3
        let reps = 6
        let weight = 135.0
                
        let benchPress = BenchPress(id: id, sets: sets, reps: reps, weight: weight, unit: WeightUnit(weightSymbol: .lb))
        
        //Initializer Tests: Boolean values
        let idInitialized = benchPress.id == id
        let setsInitialized: Bool = (benchPress[.sets]?.value == .integer(sets)) ? true : false
        let repsInitialized: Bool = (benchPress[.reps]?.value == .integer(reps)) ? true : false
        let weightInitialized: Bool = (benchPress[.weight]?.value == .double(weight)) ? true: false
        
        let duration: TimeInterval? = nil
        let notes: String? = nil
        
        //Equality Tests
        let temp_id = UUID()
        let temp_attributes = benchPress.attributes
        let temp_date = benchPress.date
        
        let tempBenchPress = BenchPress(id: temp_id, sets: 3, reps: 6, weight: 135, unit: WeightUnit(weightSymbol: .lb))
        let copyExercise = tempBenchPress
        
        let diffIDExercisesAreEqual = tempBenchPress == benchPress //Exercises with different IDs !=
        let sameIDExercisesAreEqual = tempBenchPress == copyExercise //Exercises with same IDs ==
        
        XCTAssertTrue(idInitialized)
        XCTAssertTrue(setsInitialized)
        XCTAssertTrue(repsInitialized)
        XCTAssertTrue(weightInitialized)
        XCTAssertNotNil(benchPress.date)
        XCTAssertNil(duration)
        XCTAssertNil(notes)
        
        XCTAssertFalse(diffIDExercisesAreEqual)
        XCTAssertTrue(sameIDExercisesAreEqual)
    }
    
    func testDeadlift() throws {
        //Setup
        let id = UUID()
        let sets = 3
        let reps = 6
        let weight = 135.0
        
        let deadlift = Deadlift(id: id, sets: sets, reps: reps, weight: weight, unit: WeightUnit(weightSymbol: .kg))
        
        //Initializer Tests: Boolean values
        let idInitialized = deadlift.id == id
        let setsInitialized: Bool = (deadlift[.sets]?.value == .integer(sets)) ? true : false
        let repsInitialized: Bool = (deadlift[.reps]?.value == .integer(reps)) ? true : false
        let weightInitialized: Bool = (deadlift[.weight]?.value == .double(weight)) ? true: false
        
    }
    
    func testSquat() throws {
        
    }

}
