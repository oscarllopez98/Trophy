//
//  TrophyRESTAPI.swift
//  Trophy
//
//  Created by Oscar Lopez on 3/22/24.
//

import Foundation
import AWSAPIGateway

class TrophyRESTAPI {
    
    /**
     Sends a PUT request to update a user exercise.
     
     - Parameters:
        - exercise: The exercise object to be updated.
     */
    func PUTUserExercise(exercise: Exercise) async -> String? {
        do {
            // Prepare request depending if we have an Exercise ID or not
            let request = exercise.id != nil ? try preparePUTUserExerciseRequest(userId: "4bf0e7ef-cd19-4b0c-b9a2-e946c58e01d1", exerciseId: exercise.id!.uuidString)
            : try preparePUTUserExerciseRequest(userId: "4bf0e7ef-cd19-4b0c-b9a2-e946c58e01d1")
            
            let jsonObject: [String: Any] = preparePUTUserExerciseJSON(name: exercise.name,
                                                                       type: exercise.type.asString,
                                                                       attributes: exercise.attributes,
                                                                       notes: exercise.notes!)
            // Prepare the request data with JSON payload
            let requestWithBody = try preparePUTUserExerciseRequestData(inRequest: request, jsonObject: jsonObject)
            // Use await to handle the response
            return await handlePUTUserExerciseResponse(inRequest: requestWithBody, jsonObject: jsonObject)
        } catch {
            print("Error preparing request data: \(error)")
            return nil
        }

     
    }

    /**
     Sends a GET request to retrieve a user exercise.
     
     - Parameters:
        - userId: The user id for the object to be retrieved.
        - exerciseId: The exercise id for the object to be retrieved.
     */
    func GETUserExercise(userId: String, exerciseId: String) async throws -> Exercise {
        if (userId.isEmpty) { throw APIError.emptyParameter(parameterName: "userId") }
        if (exerciseId.isEmpty) { throw APIError.emptyParameter(parameterName: "exerciseId") }
        
        let request = prepareGETUserExerciseRequest(userId: userId, exerciseId: exerciseId)
        do {
            // Try to get the User Exercise
            return try await handleGETUserExerciseResponse(inRequest: request)
        } catch {
            // Throw an Error if the GET request failed
            throw APIError.GETUserExerciseFailed(userId: userId, exerciseId: exerciseId)
        }
    }

    /**
     Prepares a URLRequest for a PUT user exercise API request.
     
     - Parameters:
        - userId: The ID of the user.
        - exerciseId: The ID of the exercise.
     - Returns: A URLRequest object for the PUT request.
     */
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
    
    /**
     Prepares a URLRequest for a PUT user exercise API request.
     
     - Parameters:
        - userId: The ID of the user.
        - exerciseId: The ID of the exercise.
     - Returns: A URLRequest object for the PUT request.
     */
    func preparePUTUserExerciseRequest(userId: String, exerciseId: String) throws -> URLRequest {
        if (userId.isEmpty) { throw APIError.emptyParameter(parameterName: "userId") }
        if (exerciseId.isEmpty) { throw APIError.emptyParameter(parameterName: "userId") }

        let path = "https://xhh2wpxj6f.execute-api.us-east-1.amazonaws.com/Prod/users/\(userId)/exercises/\(exerciseId)"
        guard let url = URL(string: path) else {
            fatalError("Invalid URL: \(path)")
        }
        
        // Create a URLRequest with the URL + Set the HTTP method to PUT
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        
        // Set the API key in the request headers
        request.addValue("eJft9CvQjC9WqubQzLaFS7rAPrjRWCKt99QuLHAm", forHTTPHeaderField: "x-api-key")
        return request
    }
    
    func preparePUTUserExerciseRequest(userId: String) throws -> URLRequest {
        if (userId.isEmpty) { throw APIError.emptyParameter(parameterName: "userId") }

        let path = "https://xhh2wpxj6f.execute-api.us-east-1.amazonaws.com/Prod/users/\(userId)/exercises/"
        guard let url = URL(string: path) else {
            fatalError("Invalid URL: \(path)")
        }
        
        // Create a URLRequest with the URL + Set the HTTP method to PUT
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        
        // Set the API key in the request headers
        request.addValue("eJft9CvQjC9WqubQzLaFS7rAPrjRWCKt99QuLHAm", forHTTPHeaderField: "x-api-key")
        return request
    }
    /**
     Prepares a URLRequest for a PUT user exercise API request.
     
     - Returns: A URLRequest object for the PUT request.
     */
    func preparePUTUserExerciseRequest() -> URLRequest {
        // Create a URLRequest with the URL + Set the HTTP method to PUT
        var request = URLRequest(url: getPUTUserExerciseEndpointPath())
        request.httpMethod = "PUT"

        // Set the API key in the request headers
        request.setValue("eJft9CvQjC9WqubQzLaFS7rAPrjRWCKt99QuLHAm", forHTTPHeaderField: "x-api-key")
        
        return request
    }
    
    /**
     Prepares the JSON payload for a PUT user exercise API request.
     
     - Parameters:
        - id: The ID of the exercise.
        - name: The name of the exercise.
        - type: The type of the exercise.
        - attributes: The attributes of the exercise.
        - notes: Any notes associated with the exercise.
     - Returns: A dictionary representing the JSON payload.
     */
    func preparePUTUserExerciseJSON(name: String,
                                    type: String,
                                    attributes: [Exercise.AttributeName:ExerciseAttribute]? = nil,
                                    notes: String) -> [String: Any]{
        
        var distanceDict: [String: Any]? = nil
        if let distanceAttribute = attributes?[.distance] as? DistanceAttribute {
            distanceDict = DistanceAttributeConverter().convertToAPIFormat(distanceAttribute)
        }
        
        var timeDict: [String: Any]? = nil
        if let timeAttribute = attributes?[.time] as? TimeAttribute {
            timeDict = TimeAttributeConverter().convertToAPIFormat(timeAttribute)
        }
        
        var setsDict: [String: Any]? = nil
        if let setsAttribute = attributes?[.sets] as? SetsAttribute {
            setsDict = SetsAttributeConverter().convertToAPIFormat(setsAttribute)
        }
        
        var repsDict: [String: Any]? = nil
        if let repsAttribute = attributes?[.reps] as? RepsAttribute {
            repsDict = RepsAttributeConverter().convertToAPIFormat(repsAttribute)
        }
        
        var weightDict: [String: Any]? = nil
        if let weightAttribute = attributes?[.weight] as? WeightAttribute {
            weightDict = WeightAttributeConverter().convertToAPIFormat(weightAttribute)
        }
        
        var intensityDict: [String: Any]? = nil
        if let intensityAttribute = attributes?[.intensity] as? IntensityAttribute {
            intensityDict = IntensityAttributeConverter().convertToAPIFormat(intensityAttribute)
        }
        
        var levelDict: [String: Any]? = nil
        if let levelAttribute = attributes?[.level] as? LevelAttribute {
            levelDict = LevelAttributeConverter().convertToAPIFormat(levelAttribute)
        }
        
        var jsonObject: [String: Any] = [
            "exercise": [
                "name": name,
                "type": type,
                "attributes": [
                    "distance": distanceDict as Any,
                    "time": timeDict as Any,
                    "sets": setsDict as Any,
                    "reps": repsDict as Any,
                    "weight": weightDict as Any,
                    "intensity": intensityDict as Any,
                    "level": levelDict as Any
                ],
                "notes": notes
            ]
        ]
        
        // Conditionally add ID if it's not nil
//        if var exerciseDict = jsonObject["exercise"] as? [String: Any] {
//            if let id = id {
//                exerciseDict["id"] = id.uuidString
//            }
//            jsonObject["exercise"] = exerciseDict
//        }
        
        return jsonObject
    }

    /**
     Prepares the URLRequest data for a PUT user exercise API request.
     
     - Parameters:
        - inRequest: The input URLRequest.
        - jsonObject: The JSON object to be included in the request body.
     - Returns: A URLRequest object with the JSON data set as the HTTP body.
     - Throws: An error if there is an issue creating the JSON data.
     */
    func preparePUTUserExerciseRequestData(inRequest: URLRequest, jsonObject: [String: Any]) throws -> URLRequest {
        let jsonData = try JSONSerialization.data(withJSONObject: jsonObject, options: [])
        // Set the request body with the JSON data
        var outRequest = inRequest
        outRequest.httpBody = jsonData
        outRequest.addValue("application/json", forHTTPHeaderField: "Content-Type") // Ensure content type is set
        return outRequest
    }

    
    /**
     Constructs the URL for the PUT user exercise API endpoint.
     
     - Returns: The URL for the API endpoint.
     */
    func getPUTUserExerciseEndpointPath() -> URL {
        // Create a URL for your API endpoint
        let endpointPath = "/users/4bf0e7ef-cd19-4b0c-b9a2-e946c58e01d1/exercises"
        let url = URL(string: "https://xhh2wpxj6f.execute-api.us-east-1.amazonaws.com/Prod" + endpointPath)!
        return url
    }
    
    /**
     Handles the response from a PUT user exercise API request.
     
     - Parameters:
        - inRequest: The input URLRequest.
        - jsonObject: The JSON object returned in the response.
        - completion: A closure to be called upon completion of the API call, returning the exercise ID if successful, or nil otherwise.
     */
    func handlePUTUserExerciseResponse(inRequest: URLRequest, jsonObject: [String: Any]) async -> String? {
        // Perform the async network operation, e.g., using URLSession
        do {
            let (data, _) = try await URLSession.shared.data(for: inRequest)
            // Parse the data to extract the exercise ID
            if let jsonResponse = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
               let exerciseId = jsonResponse["exerciseId"] as? String {
                return exerciseId
            } else {
                return nil
            }
        } catch {
            // Handle error appropriately
            print("Error handling PUT user exercise response: \(error)")
            return nil
        }
    }


    /**
     Constructs the URL for the GET user exercise API endpoint.
     
     - Parameters:
        - userId: The ID of the user.
        - exerciseId: The ID of the exercise.
     - Returns: The URL for the API endpoint.
     */
    func handleGETUserExerciseResponse(inRequest: URLRequest) async throws -> Exercise {
        // Perform the async network operation, e.g., using URLSession
        do {
            let (data, _) = try await URLSession.shared.data(for: inRequest)
            // Handle the data appropriately
            if let jsonResponse = try? JSONSerialization.jsonObject(with: data) as? [String: Any] {
                // Process the JSON response
                print("GET User Exercise response: \(jsonResponse)")
                return try ExerciseConverter().convertExerciseJSONResponseToExercise(jsonResponse)
            }
        } catch {
            // Handle error appropriately
            print("Error handling GET user exercise response: \(error)")
        }
        throw APIError.GETUserExerciseFailedResponse
    }
    
    /**
     Handles the response from a GET user exercise API request.
     
     - Parameter inRequest: The input URLRequest.
     */
//    func handleGETUserExerciseResponse(inRequest: URLRequest) async throws {
//        // Create a URLSessionDataTask to make the request
//        let task = URLSession.shared.dataTask(with: inRequest) { data, response, error in
//            // Handle the response or error here
//            if let error = error {
//                print("Error: \(error)")
//                return
//            }
//
//            if let httpResponse = response as? HTTPURLResponse {
//                print("Status code: \(httpResponse.statusCode)")
//                
//                // Check if data is not nil
//                guard let responseData = data else {
//                    print("No data received")
//                    return
//                }
//
//                do {
//                    // Parse the response data into a dictionary
//                    if let jsonResponse = try JSONSerialization.jsonObject(with: responseData, options: []) as? [String: Any] {
//                        // Access the desired property from the dictionary
//                        if let exercise = jsonResponse["exercise"] as? [String: Any] {
//                            // Access nested values
//                            let id = exercise["id"] as? String ?? "Default Value"
//                            print("Exercise ID: \(id)")
//
//                            let name = exercise["name"] as? String ?? "Default Value"
//                            print("Exercise Name: \(name)")
//
//                            let exerciseType = exercise["exerciseType"] as? String ?? "Default Value"
//                            print("Exercise Type: \(exerciseType)")
//
//                            if let attributes = exercise["attributes"] as? [String: Any] {
//                                // Distance Attribute
//                                if let distance = attributes["distance"] as? [String: Any],
//                                   let distanceValue = distance["value"] as? Double,
//                                   let distanceUnit = distance["unit"] as? String {
//                                    print("Weight: \(distanceValue) \(distanceUnit)")
//                                }
//                                // Time Attribute
//                                if let time = attributes["time"] as? [String: Any],
//                                   let timeValue = time["value"] as? Double {
//                                    print("Time: \(timeValue)")
//                                }
//                                // Sets Attribute
//                                if let sets = attributes["sets"] as? [String: Any],
//                                   let setsValue = sets["value"] as? Int {
//                                    print("Sets: \(setsValue)")
//                                }
//                                // Reps Attribute
//                                if let reps = attributes["reps"] as? [String: Any],
//                                   let repsValue = reps["value"] as? Int {
//                                    print("Reps: \(repsValue)")
//                                }
//                                // Weight Attribute
//                                if let weight = attributes["weight"] as? [String: Any],
//                                   let weightValue = weight["value"] as? Double,
//                                   let weightUnit = weight["unit"] as? String {
//                                    print("Weight: \(weightValue) \(weightUnit)")
//                                }
//                                // Level Attribute
//                                if let level = attributes["level"] as? [String: Any],
//                                   let levelValue = level["value"] as? Int {
//                                    print("Level: \(levelValue)")
//                                }
//                                // Intensity Attribute
//                                if let intensity = attributes["intensity"] as? [String: Any],
//                                   let intensityValue = intensity["value"] as? String {
//                                    print("Intensity: \(intensityValue)")
//                                }
//                                // Date Attribute
//                                if let date = attributes["date"] as? [String: Any],
//                                   let dateValue = date["value"] as? String {
//                                    print("Date: \(dateValue)")
//                                }
//                                // Notes Attribute
//                                if let notes = attributes["notes"] as? [String: Any],
//                                   let notesValue = notes["value"] as? String {
//                                    print("Notes: \(notesValue)")
//                                }
//                            }
//                        } else {
//                            print("Exercise not found in response")
//                        }
//                    } else {
//                        print("Failed to parse JSON response")
//                    }
//                } catch {
//                    print("Error parsing JSON: \(error)")
//                }
//            }
//        }
//
//        // Start the data task
//        task.resume()
//    }
}
