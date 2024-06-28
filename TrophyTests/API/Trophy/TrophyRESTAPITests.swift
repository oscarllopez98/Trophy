import XCTest
@testable import Trophy

final class TrophyRESTAPITests: XCTestCase {

    var trophyAPI: TrophyRESTAPI!
    var testUserId: String!

    override func setUp() {
        super.setUp()
        trophyAPI = TrophyRESTAPI()
        testUserId = "4bf0e7ef-cd19-4b0c-b9a2-e946c58e01d1"
        //URLProtocol.registerClass(URLProtocolStub.self)
    }

    override func tearDown() {
        trophyAPI = nil
        testUserId = nil
        URLProtocol.unregisterClass(URLProtocolStub.self)
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
        let exerciseId = "3e42fc6b-2670-42aa-9850-47cf4742e406"
        
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
        let userInput = "I just did 10 pullups."

        if let exerciseId = await trophyRestAPI.PUTUserExerciseWithGPT(userInput: userInput, userId: testUserId) {
            print("Received GPT processed exercise ID: \(exerciseId)")
        } else {
            XCTFail("Failed to receive GPT processed exercise ID.")
        }
    }

    func testHandleGETLimitedUserExercisesResponse_validResponse() async {
        let validResponseData = """
        {
            "exercises": [
                {
                    "id": "1",
                    "name": "Running",
                    "type": "Cardio",
                    "attributes": {},
                    "notes": "Morning run"
                }
            ]
        }
        """.data(using: .utf8)!
        let request = URLRequest(url: URL(string: "https://example.com")!)

        URLProtocolStub.stub(data: validResponseData, response: nil, error: nil)

        do {
            let exercises = try await trophyAPI.handleGETLimitedUserExercisesResponse(inRequest: request)
            XCTAssertEqual(exercises.count, 1)
            XCTAssertEqual(exercises.first?.name, "Running")
        } catch {
            XCTFail("Expected valid response, but got error: \(error)")
        }
    }

    func testHandleGETLimitedUserExercisesResponse_emptyResponse() {
        let emptyResponseData = "{}".data(using: .utf8)!
        let request = URLRequest(url: URL(string: "https://example.com")!)

        URLProtocolStub.stub(data: emptyResponseData, response: nil, error: nil)

        let expectation = XCTestExpectation(description: "GETLimitedUserExercisesResponse_emptyResponse")

        Task {
            do {
                let _ = try await trophyAPI.handleGETLimitedUserExercisesResponse(inRequest: request)
                XCTFail("Expected error of type APIError.GETUserExerciseFailedResponse")
            } catch {
                XCTAssertEqual(error as? APIError, APIError.GETUserExerciseFailedResponse)
            }
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 20)
    }

    func testHandleGETLimitedUserExercisesResponse_malformedJSON() async {
        let malformedJSONData = """
        {
            "invalid_key": "invalid_value"
        }
        """.data(using: .utf8)!
        let request = URLRequest(url: URL(string: "https://example.com")!)

        URLProtocolStub.stub(data: malformedJSONData, response: nil, error: nil)

        XCTAssertThrowsError(Task{try await trophyAPI.handleGETLimitedUserExercisesResponse(inRequest: request)}) { error in
            XCTAssertEqual(error as? APIError, APIError.GETUserExerciseFailedResponse)
        }
    }

    func testHandleGETLimitedUserExercisesResponse_networkError() async {
        let request = URLRequest(url: URL(string: "https://example.com")!)
        let networkError = NSError(domain: "network", code: -1, userInfo: nil)

        URLProtocolStub.stub(data: nil, response: nil, error: networkError)

        XCTAssertThrowsError(Task{try await trophyAPI.handleGETLimitedUserExercisesResponse(inRequest: request)}) { error in
            XCTAssertEqual(error as? NSError, networkError)
        }
    }

    func testExerciseListViewModel() {
        let viewModel = ExerciseListViewModel(userId: testUserId)
        let expectation = XCTestExpectation(description: "Fetch exercises")
        print("Dispatch")
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            XCTAssertEqual(viewModel.exercises.count, 10)
            expectation.fulfill()
        }
        print("Wait!")
        wait(for: [expectation], timeout: 10)
    }
}

class URLProtocolStub: URLProtocol {
    static var stubData: Data?
    static var stubResponse: URLResponse?
    static var stubError: Error?

    static func stub(data: Data?, response: URLResponse?, error: Error?) {
        stubData = data
        stubResponse = response
        stubError = error
    }

    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }

    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }

    override func startLoading() {
        if let stubData = URLProtocolStub.stubData {
            client?.urlProtocol(self, didLoad: stubData)
        }
        if let stubResponse = URLProtocolStub.stubResponse {
            client?.urlProtocol(self, didReceive: stubResponse, cacheStoragePolicy: .notAllowed)
        }
        if let stubError = URLProtocolStub.stubError {
            client?.urlProtocol(self, didFailWithError: stubError)
        }
        client?.urlProtocolDidFinishLoading(self)
    }

    override func stopLoading() {}
}
