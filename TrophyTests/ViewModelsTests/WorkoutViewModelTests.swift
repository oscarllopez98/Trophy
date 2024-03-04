//
//  WorkoutViewModelTests.swift
//  TrophyTests
//
//  Created by Oscar Lopez on 3/1/24.
//

import XCTest
@testable import Trophy

final class WorkoutViewModelTests: XCTestCase {

    var workoutViewModel: WorkoutViewModel!
    var workout: Workout!
    var emptyWorkoutViewModel: WorkoutViewModel!
    var emptyWorkout: Workout!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        
        //Create Test Exercises
        let exerciseList = ExerciseFactory.shared.createTestExerciseList(numExercises: 5)
        
        if (!exerciseList.isEmpty) {
            workout = WorkoutFactory.shared.createWorkout(exerciseList: exerciseList)
            emptyWorkout = WorkoutFactory.shared.createWorkout(exerciseList: [])
            
            workoutViewModel = WorkoutViewModel(id: workout.id,
                                             name: workout.name,
                                             exercises: workout.exercises,
                                             date: workout.date,
                                             duration: workout.duration,
                                             notes: workout.notes)
            
            emptyWorkoutViewModel = WorkoutViewModel(id: emptyWorkout.id,
                                             name: emptyWorkout.name,
                                             exercises: emptyWorkout.exercises,
                                             date: emptyWorkout.date,
                                             duration: emptyWorkout.duration,
                                             notes: emptyWorkout.notes)
        } else {
            XCTFail("Error occurred in setUp() method: 'workout' instance variable should not be empty.")
        }
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        workout = nil
        emptyWorkout = nil
        
        super.tearDown()
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    //MARK: Initialization
    func testWorkoutViewModelInitialization() {
        XCTAssertNotNil(workoutViewModel)
        XCTAssertNotNil(emptyWorkoutViewModel)
    }
    
    func testWorkoutViewModelMemberInitialization() {
        //Test that non-optional members of a WorkoutViewModel with a non-empty list of Exercise objects is not nil
        XCTAssertNotNil(workoutViewModel.id)
        XCTAssertNotNil(workoutViewModel.name)
        XCTAssertNotNil(workoutViewModel.exercises)
        XCTAssertNotNil(workoutViewModel.date)
        
        //Test that non-optional members of a WorkoutViewModel with an empty list of Execise objects is not nil
        XCTAssertNotNil(emptyWorkoutViewModel.id)
        XCTAssertNotNil(emptyWorkoutViewModel.name)
        XCTAssertNotNil(emptyWorkoutViewModel.exercises)
        XCTAssertNotNil(emptyWorkoutViewModel.date)
    }
    
    //MARK: Equality
    func testWorkoutViewModelEqual() {
        
        let copyViewModel: WorkoutViewModel = workoutViewModel
        
        XCTAssertEqual(workoutViewModel.id, copyViewModel.id)
    }
    
    func testWorkoutViewModelNotEqual() {
        XCTAssertNotEqual(workoutViewModel.id, emptyWorkoutViewModel.id)
    }
    
    //MARK: Getters
    
    func testWorkoutViewModelGetID() {
        XCTAssertEqual(workoutViewModel.id, workoutViewModel.getID())
        XCTAssertEqual(workoutViewModel.id.uuidString, workoutViewModel.getIDAsString())
    }
    
    func testWorkoutViewModelGetName() {
        XCTAssertEqual(workoutViewModel.name, workoutViewModel.getName())
    }
    
    func testWorkoutViewModelGetExercises() {
        XCTAssertEqual(workoutViewModel.exercises, workoutViewModel.getExercises())
    }
    
    func testWorkoutViewModelGetDate() {
        XCTAssertEqual(workoutViewModel.date, workoutViewModel.getDate())
        XCTAssertNotNil(workoutViewModel.getDateFormatted())
    }
    
    func testWorkoutViewModelGetDuration() {
        XCTAssertEqual(workoutViewModel.duration, workoutViewModel.getDuration())
    }
    
    func testWorkoutViewModelGetNotes() {
        XCTAssertEqual(workoutViewModel.notes, workoutViewModel.getNotes())
    }

}
