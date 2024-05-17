//
//  TrophyRESTAPITests.swift
//  TrophyTests
//
//  Created by Oscar Lopez on 3/22/24.
//

import XCTest
@testable import Trophy

final class TrophyRESTAPITests: XCTestCase {

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
    
    func testTrophyRESTAPITestPUTAPICall() {
        let trophyRestAPI = TrophyRESTAPI()
        
        let expectation = XCTestExpectation(description: "API Call Completed")
        
        // Execute the async function
        trophyRestAPI.testPUTAPICall() { exerciseId in
            if let id = exerciseId {
                print("Received exercise ID: \(id)")
                XCTAssertNotNil(id)
            } else {
                XCTFail("No exercise ID found.")
            }
        }
        
        //Fulfill the expectation after a delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 8) { // Adjust timeout as needed
            expectation.fulfill()
        }
        
        //Wait for the expectation to be fulfilled within a timeout
        wait(for: [expectation], timeout: 8) // Adjust timeout as needed
    }
    
    func testTrophyRESTAPITestPUTAPICallWithExercise() {
        let trophyRestAPI = TrophyRESTAPI()
        
        let expectation = XCTestExpectation(description: "API Call Completed")
        
        let exercise = ExerciseFactory.shared.createTestExercise()
        exercise.id = UUID(uuidString: "3a153e13-e098-4988-94cb-453a347c9dc3")!
        
        // Execute the async function
        trophyRestAPI.PUTUserExercise(exercise: exercise) { exerciseId in
            if let id = exerciseId {
                print("Received exercise ID: \(id)")
                XCTAssertNotNil(id)
            } else {
                XCTFail("No exercise ID found.")
            }
        }
        
        //Fulfill the expectation after a delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 8) { // Adjust timeout as needed
            expectation.fulfill()
        }
        
        //Wait for the expectation to be fulfilled within a timeout
        wait(for: [expectation], timeout: 8) // Adjust timeout as needed
    }
    
    func testPreparePUTUserExerciseJSON() {
        // Define mock attributes
        let mockDistanceAttribute = DistanceAttribute(distance: 5.0, unit: DistanceUnit(distanceSymbol: .km))
        let mockTimeAttribute = TimeAttribute(time: 30)
        let mockSetsAttribute = SetsAttribute(sets: 3)
        let mockRepsAttribute = RepsAttribute(reps: 10)
        let mockWeightAttribute = WeightAttribute(weight: 50.0, unit: WeightUnit(weightSymbol: .lb))
        let mockIntensityAttribute = IntensityAttribute(value: .high)
        let mockLevelAttribute = LevelAttribute(value: .five)
        
        let attributes: [Exercise.AttributeName: ExerciseAttribute] = [
            .distance: mockDistanceAttribute,
            .time: mockTimeAttribute,
            .sets: mockSetsAttribute,
            .reps: mockRepsAttribute,
            .weight: mockWeightAttribute,
            .intensity: mockIntensityAttribute,
            .level: mockLevelAttribute
        ]
        
        let name: String = "Test Exercise"
        let type = ExerciseType.cardio.asString
        let notes = "Test Notes"
        
        let expectedOutput: [String: Any] = [
            "exercise": [
                "name": name,
                "type": type,
                "attributes": [
                    "distance": DistanceAttributeConverter().convertToAPIFormat(mockDistanceAttribute),
                    "time": TimeAttributeConverter().convertToAPIFormat(mockTimeAttribute),
                    "sets": SetsAttributeConverter().convertToAPIFormat(mockSetsAttribute),
                    "reps": RepsAttributeConverter().convertToAPIFormat(mockRepsAttribute),
                    "weight": WeightAttributeConverter().convertToAPIFormat(mockWeightAttribute),
                    "intensity": IntensityAttributeConverter().convertToAPIFormat(mockIntensityAttribute),
                    "level": LevelAttributeConverter().convertToAPIFormat(mockLevelAttribute)
                ],
                "notes": notes
            ]
        ]

        let result: [String: Any] = TrophyRESTAPI()
            .preparePUTUserExerciseJSON(id: UUID(uuidString: "705da5bc-75ec-46d4-88e3-1f0ebfdafb65"),
                                        name: name,
                                        type: type,
                                        attributes: attributes,
                                        notes: notes)
        
        // Log the results
        print("Result: \(result)")
        print("Expected Output: \(expectedOutput)")
        
        
        // Compare the results
    }
    
    func testGETUserExercise() {
        
        let trophyRestAPI = TrophyRESTAPI()

        let expectation = XCTestExpectation(description: "API Call - GET - Completed")
        
        // Execute the async funciton
        trophyRestAPI.testGetUserExercise()
        
        //Fulfill the expectation after a delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 8) { // Adjust timeout as needed
            expectation.fulfill()
        }
        
        //Wait for the expectation to be fulfilled within a timeout
        wait(for: [expectation], timeout: 8) // Adjust timeout as needed
    }
    
    

}
