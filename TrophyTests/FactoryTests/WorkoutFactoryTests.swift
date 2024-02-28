//
//  WorkoutFactoryTests.swift
//  TrophyTests
//
//  Created by Oscar Lopez on 2/27/24.
//

import XCTest
@testable import Trophy

final class WorkoutFactoryTests: XCTestCase {

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
    
    //MARK: Object Creation
    func testWorkoutFactoryObjectCreation() {
        let workout = WorkoutFactory.shared.createTestWorkout()
        XCTAssertNotNil(workout)
    }
    
    //MARK: Error Handling
    
    //MARK: Data Validation
    func testWorkoutFactoryValidateName() {
        let workoutValid = WorkoutFactory.shared.createTestWorkoutWithName("First Test Workout")
        let workoutInvalidEmptyName = WorkoutFactory.shared.createTestWorkoutWithName("")
        let workoutInvalidTooLong = WorkoutFactory.shared.createTestWorkoutWithName("This is Workout is invalid because the name is too long!!")
        
        XCTAssertTrue(WorkoutValidationHelper.validateName(workoutValid.name))
        XCTAssertFalse(WorkoutValidationHelper.validateName(workoutInvalidEmptyName.name))
        XCTAssertFalse(WorkoutValidationHelper.validateName(workoutInvalidTooLong.name))
    }
    
    func testWorkoutFactoryValidateExercises() {
        //Validate Workout with 1 Exercise and valid name length
        let workoutValid = WorkoutFactory.shared.createTestWorkoutWithName("My valid workout")
        
        //Invalid Workout with 0 Exercises
        let emptyExerciseList: [Exercise] = []
        let workoutInvalidEmptyList = WorkoutFactory.shared.createWorkout(exerciseList: emptyExerciseList)
        
        //Invalid Workout with > 10 Exercises
        var tooLongExerciseList: [Exercise] = []
        for num in 1...11 {
            tooLongExerciseList.append(ExerciseFactory.shared.createTestExercise())
        }
        let workoutInvalidTooLongList = WorkoutFactory.shared.createWorkout(exerciseList: tooLongExerciseList)
        
        XCTAssertTrue(WorkoutValidationHelper.validateExercises(workoutValid.exercises))
        XCTAssertFalse(WorkoutValidationHelper.validateExercises(workoutInvalidEmptyList.exercises))
        XCTAssertFalse(WorkoutValidationHelper.validateExercises(workoutInvalidTooLongList.exercises))
    }

}
