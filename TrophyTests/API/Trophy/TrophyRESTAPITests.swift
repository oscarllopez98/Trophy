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
    
    func testPUTUserExercise() async {
        // Instantiate API client
        let trophyRestAPI = TrophyRESTAPI()

        // Get a test exercise and update the ID for one we know exists in the DB
        let exercise = ExerciseFactory.shared.createTestExercise()
        exercise.id = UUID(uuidString: "3a153e13-e098-4988-94cb-453a347c9dc3")!
        
        // Call the async function and await its result
        if let exerciseId = await trophyRestAPI.PUTUserExercise(exercise: exercise) {
            print("Received exercise ID: \(exerciseId)")
        } else {
            print("Failed to receive exercise ID.")
        }
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
            .preparePUTUserExerciseJSON(name: name,
                                        type: type,
                                        attributes: attributes,
                                        notes: notes)
        
        // Log the results
        print("Result: \(result)")
        print("Expected Output: \(expectedOutput)")
    }
    
    func testGETUserExercise() async {
        
        // Instantiate API client
        let trophyRestAPI = TrophyRESTAPI()
        let userId = "4bf0e7ef-cd19-4b0c-b9a2-e946c58e01d1"
        let exerciseId = "15132D4C-4C6B-462F-A162-F967291A1424"
        
        // Execute the async function
        do {
            let exercise: Exercise = try await trophyRestAPI.GETUserExercise(userId: userId, exerciseId: exerciseId)
            ExerciseLogger().logExercise(exercise)
        } catch {
            XCTFail("Could not GET User Exercise with userId \(userId) and exerciseId \(exerciseId)")
        }
    }
    
    func testUpdateFlowForUserExercise() async {
        // Instantiate API client
        let client = TrophyRESTAPI()

        // Get a test exercise and update the ID for one we know exists in the DB
        let exercise = ExerciseFactory.shared.createTestExerciseV2()
        
        // Create a sample Exercise object
        let updatedExercise = Exercise(
            name: "Test Exercise",
            type: .other,
            attributes: [
                .distance: DistanceAttribute(distance: 5, unit: .init(distanceSymbol: .km)),
                .time: TimeAttribute(time: 1800),
                .sets: SetsAttribute(sets: 10),
                .reps: RepsAttribute(reps: 15),
                .weight: WeightAttribute(weight: 75.5, unit: .init(weightSymbol: .lb)),
                .intensity: IntensityAttribute(value: .high),
                .level: LevelAttribute(value: .five)
            ],
            date: Date(),
            notes: "Ran for 30 minutes")
        
        //- - PUT Exercise - -
        // Call the async function and await its result
        if let oldExerciseId = await client.PUTUserExercise(exercise: exercise) {
            print("PUT success with exercise ID: \(oldExerciseId)")
            
            //- - GET Exercise : With newly generated exerciseId - -
            do {
                try await client.GETUserExercise(userId: "4bf0e7ef-cd19-4b0c-b9a2-e946c58e01d1", exerciseId: oldExerciseId)
            } catch {
                XCTFail("Could not GET User Exercise with userId \("4bf0e7ef-cd19-4b0c-b9a2-e946c58e01d1") and exerciseId \(oldExerciseId)")
            }
            updatedExercise.id = UUID(uuidString: oldExerciseId)
            
            //- - UPDATE Exercise - -
            if let newExerciseId = await client.PUTUserExercise(exercise: updatedExercise) {
                print("PUT success with exercise ID: \(newExerciseId)")
                
                //- - GET Updated Exercise : With existing generated exerciseId - -
                do {
                    try await client.GETUserExercise(userId: "4bf0e7ef-cd19-4b0c-b9a2-e946c58e01d1", exerciseId: newExerciseId)
                } catch {
                    XCTFail("Could not GET User Exercise with userId \("4bf0e7ef-cd19-4b0c-b9a2-e946c58e01d1") and exerciseId \(newExerciseId)")
                }
                XCTAssertEqual(oldExerciseId.lowercased(), newExerciseId.lowercased())
            } else {
                XCTFail("Failed to PUT Updated Exercise.")
            }
            
        } else {
            print("Using Exercise ID:", exercise.id!.uuidString)
            XCTFail("Failed to PUT Exercise.")
        }


        
        
    }
}
