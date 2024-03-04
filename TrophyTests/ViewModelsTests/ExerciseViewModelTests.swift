//
//  ExerciseViewModelTests.swift
//  TrophyTests
//
//  Created by Oscar Lopez on 3/2/24.
//

import XCTest
@testable import Trophy

final class ExerciseViewModelTests: XCTestCase {

    var exerciseViewModel: ExerciseViewModel!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        
        exerciseViewModel = ExerciseViewModel(id: UUID(),
                                              name: "Test name",
                                              type: .other,
                                              attributes: [:],
                                              date: Date())
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
    func testExerciseViewModelInitialization() {
        XCTAssertNotNil(exerciseViewModel)
    }
    
    func testExerciseViewModelMemberInitialization() {
        XCTAssertNotNil(exerciseViewModel.id)
        XCTAssertNotNil(exerciseViewModel.name)
        XCTAssertNotNil(exerciseViewModel.type)
        XCTAssertNotNil(exerciseViewModel.attributes)
        XCTAssertNotNil(exerciseViewModel.date)
    }
    
    //MARK: Equality
    func testExerciseViewModelEqual() {
        let copyViewModel: ExerciseViewModel = exerciseViewModel
        XCTAssertEqual(copyViewModel.id, exerciseViewModel.id)
    }
    
    func testExerciseViewModelNotEqual() {
        let newViewModel: ExerciseViewModel = ExerciseViewModel(id: UUID(),
                                                                name: "New Name",
                                                                type: .cardio,
                                                                attributes: [:],
                                                                date: Date())
        XCTAssertNotEqual(newViewModel.id, exerciseViewModel.id)
    }
    
    
    //MARK: Getters
    
    func testExerciseViewModelGetID() {
        XCTAssertEqual(exerciseViewModel.id, exerciseViewModel.getID())
        XCTAssertEqual(exerciseViewModel.id.uuidString, exerciseViewModel.getIDAsString())
    }
    
    func testExerciseViewModelGetName() {
        XCTAssertEqual(exerciseViewModel.name, exerciseViewModel.getName())
    }
    
    func testExerciseViewModelGetAttributes() {
        XCTAssertEqual(exerciseViewModel.attributes, exerciseViewModel.getExerciseAttributes())
    }
    
    func testExerciseViewModelGetDate() {
        XCTAssertEqual(exerciseViewModel.date, exerciseViewModel.getDate())
    }
    
    func testExerciseViewModelGetDuration() {
        XCTAssertEqual(exerciseViewModel.duration, exerciseViewModel.getDuration())
    }
    
    func testExerciseViewModelGetNotes() {
        XCTAssertEqual(exerciseViewModel.notes, exerciseViewModel.getNotes())
    }
}
