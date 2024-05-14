//
//  TrophyRESTAPI.swift
//  Trophy
//
//  Created by Oscar Lopez on 3/22/24.
//

import Foundation
import AWSAPIGateway

class TrophyRESTAPI {
    

//    func testAPICall() {
//        testAPICall(a: 10, b: 20, op: "+")
//    }
    func testPUTAPICall() {
        let request = preparePUTUserExerciseRequest()
        let jsonObject: [String: Any] = preparePUTUserExerciseJSON()
        handlePUTUserExerciseResponse(inRequest: request, jsonObject: jsonObject)
    }
    
    func testGetUserExercise() {
        let userId = "4bf0e7ef-cd19-4b0c-b9a2-e946c58e01d1"
        let exerciseId = "ec4f64f9-d0a6-4a50-bdec-146f83438bcd"
        
        let request = prepareGETUserExerciseRequest(userId: userId, exerciseId: exerciseId)
        
        handleGETUserExerciseResponse(inRequest: request)
    }
    
    func prepareGETUserExerciseRequest(userId: String, exerciseId: String) -> URLRequest {
        let path = "https://xhh2wpxj6f.execute-api.us-east-1.amazonaws.com/Prod/users/\(userId)/exercises/\(exerciseId)"
        guard let url = URL(string: path) else {
            fatalError("Invalid URL: \(path)")
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("eJft9CvQjC9WqubQzLaFS7rAPrjRWCKt99QuLHAm", forHTTPHeaderField: "x-api-key")
        return request
    }
    
    func preparePUTUserExerciseRequest() -> URLRequest {
        // Create a URLRequest with the URL
        var request = URLRequest(url: getPUTUserExerciseEndpointPath())

        
        // Set the HTTP method to POST (or PUT, DELETE, etc. depending on your API)
        request.httpMethod = "PUT"

        // Set the API key in the request headers
        request.setValue("eJft9CvQjC9WqubQzLaFS7rAPrjRWCKt99QuLHAm", forHTTPHeaderField: "x-api-key")
        
        return request
    }
    
    func preparePUTUserExerciseJSON() -> [String: Any] {
        let jsonObject: [String: Any] = [
            "exercise": [
                "name": "iOS Test Exercise",
                "type": "cardio",
                "attributes": [
                    "distance": ["value": 5, "unit": "mi"],
                    "time": ["value": 9000],
                    "sets": ["value": 5],
                    "reps": ["value": 10],
                    "weight": ["value": 100, "unit": "kg"],
                    "intensity": ["value": "med"],
                    "level": ["value": 8]
                ],
                "notes": "This is from my iOS App!"
            ]
        ]
        return jsonObject
    }
    
    func preparePUTUserExerciseRequestData(inRequest: URLRequest, jsonObject: [String: Any]) throws -> URLRequest {
        let jsonData = try JSONSerialization.data(withJSONObject: jsonObject, options: [])

        // Set the request body with the JSON data
        var outRequest = inRequest
        outRequest.httpBody = jsonData
        return outRequest
    }
    
    func getPUTUserExerciseEndpointPath() -> URL {
        // Create a URL for your API endpoint
        let endpointPath = "/users/4bf0e7ef-cd19-4b0c-b9a2-e946c58e01d1/exercises"
        let url = URL(string: "https://xhh2wpxj6f.execute-api.us-east-1.amazonaws.com/Prod" + endpointPath)!
        return url
    }
    
    func handlePUTUserExerciseResponse(inRequest: URLRequest, jsonObject: [String: Any]) {
        do {
            let outRequest = try preparePUTUserExerciseRequestData(inRequest: inRequest, jsonObject: jsonObject)

            // Create a URLSessionDataTask to make the request
            let task = URLSession.shared.dataTask(with: outRequest) { data, response, error in
                // Handle the response or error here
                if let error = error {
                    print("Error: \(error)")
                    return
                }

                if let httpResponse = response as? HTTPURLResponse {
                    print("Status code: \(httpResponse.statusCode)")
                    
                    // Check if data is not nil
                    guard let responseData = data else {
                        print("No data received")
                        return
                    }

                    do {
                        // Parse the response data into a dictionary
                        if let jsonResponse = try JSONSerialization.jsonObject(with: responseData, options: []) as? [String: Any] {
                            // Access the desired property from the dictionary
                            if let exerciseId = jsonResponse["exerciseId"] as? String {
                                print("Exercise ID: \(exerciseId)")
                            } else {
                                print("Exercise ID not found in response")
                            }
                        } else {
                            print("Failed to parse JSON response")
                        }
                    } catch {
                        print("Error parsing JSON: \(error)")
                    }
                }
            }

            // Start the data task
            task.resume()
        } catch {
            print("Error creating JSON: \(error)")
        }
    }
    
    func getGETUserExerciseEndpointPath(userId: String, exerciseId: String) -> URL {
        // Create a URL for your API endpoint
        let endpointPath = "/users/\(userId)/exercises/\(exerciseId)"
        let url = URL(string: "https://xhh2wpxj6f.execute-api.us-east-1.amazonaws.com/Prod" + endpointPath)!
        return url
    }
    
    func handleGETUserExerciseResponse(inRequest: URLRequest) {
        // Create a URLSessionDataTask to make the request
        let task = URLSession.shared.dataTask(with: inRequest) { data, response, error in
            // Handle the response or error here
            if let error = error {
                print("Error: \(error)")
                return
            }

            if let httpResponse = response as? HTTPURLResponse {
                print("Status code: \(httpResponse.statusCode)")
                
                // Check if data is not nil
                guard let responseData = data else {
                    print("No data received")
                    return
                }

                do {
                    // Parse the response data into a dictionary
                    if let jsonResponse = try JSONSerialization.jsonObject(with: responseData, options: []) as? [String: Any] {
                        // Access the desired property from the dictionary
                        if let exercise = jsonResponse["exercise"] as? [String: Any] {
                            // Access nested values
                            let id = exercise["id"] as? String ?? "Default Value"
                            print("Exercise ID: \(id)")

                            let name = exercise["name"] as? String ?? "Default Value"
                            print("Exercise Name: \(name)")

                            let exerciseType = exercise["exerciseType"] as? String ?? "Default Value"
                            print("Exercise Type: \(exerciseType)")

                            if let attributes = exercise["attributes"] as? [String: Any] {
                                // Distance Attribute
                                if let distance = attributes["distance"] as? [String: Any],
                                   let distanceValue = distance["value"] as? Double,
                                   let distanceUnit = distance["unit"] as? String {
                                    print("Weight: \(distanceValue) \(distanceUnit)")
                                }
                                // Time Attribute
                                if let time = attributes["time"] as? [String: Any],
                                   let timeValue = time["value"] as? Double {
                                    print("Time: \(timeValue)")
                                }
                                // Sets Attribute
                                if let sets = attributes["sets"] as? [String: Any],
                                   let setsValue = sets["value"] as? Int {
                                    print("Sets: \(setsValue)")
                                }
                                // Reps Attribute
                                if let reps = attributes["reps"] as? [String: Any],
                                   let repsValue = reps["value"] as? Int {
                                    print("Reps: \(repsValue)")
                                }
                                // Weight Attribute
                                if let weight = attributes["weight"] as? [String: Any],
                                   let weightValue = weight["value"] as? Double,
                                   let weightUnit = weight["unit"] as? String {
                                    print("Weight: \(weightValue) \(weightUnit)")
                                }
                                // Level Attribute
                                if let level = attributes["level"] as? [String: Any],
                                   let levelValue = level["value"] as? Int {
                                    print("Level: \(levelValue)")
                                }
                                // Intensity Attribute
                                if let intensity = attributes["intensity"] as? [String: Any],
                                   let intensityValue = intensity["value"] as? String {
                                    print("Intensity: \(intensityValue)")
                                }
                                // Date Attribute
                                if let date = attributes["date"] as? [String: Any],
                                   let dateValue = date["value"] as? String {
                                    print("Date: \(dateValue)")
                                }
                                // Notes Attribute
                                if let notes = attributes["notes"] as? [String: Any],
                                   let notesValue = notes["value"] as? String {
                                    print("Notes: \(notesValue)")
                                }
                            }
                        } else {
                            print("Exercise not found in response")
                        }
                    } else {
                        print("Failed to parse JSON response")
                    }
                } catch {
                    print("Error parsing JSON: \(error)")
                }
            }
        }

        // Start the data task
        task.resume()
    }

    
//    func testAPICall(a: NSNumber, b: NSNumber, op: String) {
//        let client = TROPHYTrophyRESTAPIClient.default()
//                
//        // Create a TROPHYInput object
//        var body = TROPHYInput()
//        
//        // Check if body is not nil before proceeding
//        if let body = body {
//            body.a = a
//            body.b = b
//            body.op = op
//            
//            // Call the API method with the unwrapped body
//            client.rootPost(body: body).continueWith { (task: AWSTask<TROPHYResult>) -> AWSTask<TROPHYResult>? in
//                self.showResult(task: task)
//                return nil
//            }
//        } else {
//            print("Failed to create Input body")
//        }
//    }
    

//    func showResult(task: AWSTask<TROPHYResult>) {
//        if let error = task.error {
//            print("Error: \(error)")
//        } else if let result = task.result {
//            if let input = result.input, let output = result.output {
//                
//                print()
//                print("POST Payload:")
//                print(result.input?.dictionaryValue)
//                
//                print("Lambda Return:")
//                print(result.output?.dictionaryValue)
//                print()
//                
//                print(String(format:"%@ %@ %@ = %@", input.a!, input.op!, input.b!, output.c!))
//                print()
//            } else {
//                print("Input or output is nil")
//            }
//        }
//    }
}
