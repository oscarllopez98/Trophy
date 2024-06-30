import XCTest
@testable import Trophy

final class TrophyRESTAPITests: XCTestCase {

    var trophyAPI: TrophyRESTAPI!
    var testUserId: String!

    override func setUp() {
        super.setUp()
        trophyAPI = TrophyRESTAPI()
        testUserId = getEnvironmentVariable("TEST_USER_ID")!
    }

    override func tearDown() {
        trophyAPI = nil
        testUserId = nil
        super.tearDown()
    }

    func testPerformanceExample() throws {
        self.measure {}
    }

    func testPUTUserExercise() async {
        let trophyRestAPI = TrophyRESTAPI()
        let exercise = ExerciseFactory.shared.createTestExerciseV3()
        
        if let exerciseId = await trophyRestAPI.PUTUserExercise(exercise: exercise, userId: testUserId) {
            print("Received exercise ID: \(exerciseId)")
        } else {
            print("Failed to receive exercise ID.")
        }
    }

    func testGETUserExercise() async {
        let trophyRestAPI = TrophyRESTAPI()
        let exerciseId = getEnvironmentVariable("TEST_EXERCISE_ID")!
        
        do {
            let exercise: Exercise = try await trophyRestAPI.GETUserExercise(userId: testUserId, exerciseId: exerciseId)
            ExerciseLogger().logExercise(exercise)
        } catch {
            XCTFail("Could not GET User Exercise with userId \(testUserId!) and exerciseId \(exerciseId)")
        }
    }

    func testGETLimitedUserExercises() async {
        let trophyRESTAPI = TrophyRESTAPI()
        
        do {
            let exercises: [Exercise] = try await trophyRESTAPI.GETLimitedUserExercises(userId: testUserId)
            XCTAssertNotNil(exercises)
        } catch {
            XCTFail("Could not GET Limited User Exercises with userId \(testUserId!)")
        }
    }

    func testUpdateFlowForUserExercise() async {
        let client = TrophyRESTAPI()
        let exercise = ExerciseFactory.shared.createTestExerciseV2()
        let updatedExercise = ExerciseFactory.shared.createTestExerciseV3()

        if let oldExerciseId = await client.PUTUserExercise(exercise: exercise, userId: testUserId) {
            print("PUT success with exercise ID: \(oldExerciseId)")

            do {
                let oldExercise = try await client.GETUserExercise(userId: testUserId, exerciseId: oldExerciseId)
                ExerciseLogger().logExercise(oldExercise)
                updatedExercise.id = oldExercise.id

                if let newExerciseId = await client.PUTUserExercise(exercise: updatedExercise, userId: testUserId) {
                    print("PUT success with exercise ID: \(newExerciseId)")

                    do {
                        let updatedExercise = try await client.GETUserExercise(userId: testUserId, exerciseId: newExerciseId)
                        ExerciseLogger().logExercise(updatedExercise)

                        XCTAssertEqual(oldExercise.id?.uuidString, updatedExercise.id?.uuidString)
                    } catch {
                        XCTFail("Could not GET User Exercise with userId \(testUserId!) and exerciseId \(newExerciseId)")
                    }
                } else {
                    XCTFail("Failed to PUT Updated Exercise.")
                }
            } catch {
                XCTFail("Could not GET User Exercise with userId \(testUserId!) and exerciseId \(oldExerciseId)")
            }
        } else {
            print("Using Exercise ID:", exercise.id!.uuidString)
            XCTFail("Failed to PUT Exercise.")
        }
    }

    func testPUTUserExerciseWithGPT() async {
        let trophyRestAPI = TrophyRESTAPI()
        let userInput = "I just did 100 push ups"

        if let exerciseId = await trophyRestAPI.PUTUserExerciseWithGPT(userInput: userInput, userId: testUserId) {
            print("Received GPT processed exercise ID: \(exerciseId)")
        } else {
            XCTFail("Failed to receive GPT processed exercise ID.")
        }
    }

}
