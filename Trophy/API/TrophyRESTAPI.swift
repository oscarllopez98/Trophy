//
//  TrophyRESTAPI.swift
//  Trophy
//
//  Created by Oscar Lopez on 3/22/24.
//

import Foundation
import AWSAPIGateway

class TrophyRESTAPI {
    
    // Access the environment variables via EnvConfig
    let INVOKE_PATH_GET_USER_EXERCISE_PROD: String = EnvConfig.INVOKE_PATH_GET_USER_EXERCISE_PROD
    let INVOKE_PATH_GET_USER_EXERCISES_PROD: String = EnvConfig.INVOKE_PATH_GET_USER_EXERCISES_PROD
    let INVOKE_PATH_PUT_USER_EXERCISE_PROD: String = EnvConfig.INVOKE_PATH_PUT_USER_EXERCISE_PROD
    let INVOKE_PATH_PUT_USER_EXERCISE_WITH_EXERCISE_ID_PROD: String = EnvConfig.INVOKE_PATH_PUT_USER_EXERCISE_WITH_EXERCISE_ID_PROD
    let INVOKE_PATH_PUT_USER_EXERCISE_GPT_PROD: String = EnvConfig.INVOKE_PATH_PUT_USER_EXERCISE_GPT_PROD
    let INVOKE_PATH_DELETE_USER_EXERCISE_PROD: String = EnvConfig.INVOKE_PATH_DELETE_USER_EXERCISE_PROD
    
    let API_KEY_PROD: String = EnvConfig.API_KEY_PROD
    
    /**
     Sends a PUT request to update a user exercise.
     
     - Parameters:
        - exercise: The exercise object to be updated.
        - userId: The user ID associated with the exercise.
     - Returns: The ID of the updated exercise if successful, or nil otherwise.
     */
    func PUTUserExercise(exercise: Exercise, userId: String) async -> String? {
        do {
            // Prepare request depending if we have an Exercise ID or not
            let request = exercise.id != nil ? try preparePUTUserExerciseRequest(userId: userId, exerciseId: exercise.id!.uuidString)
            : try preparePUTUserExerciseRequest(userId: userId)
            
            let jsonObject: [String: Any] = preparePUTUserExerciseJSON(name: exercise.name,
                                                                       type: exercise.type.asString,
                                                                       attributes: exercise.attributes,
                                                                       notes: exercise.notes ?? "")
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
        - userId: The user ID for the object to be retrieved.
        - exerciseId: The exercise ID for the object to be retrieved.
     - Returns: An Exercise object if successful.
     - Throws: An APIError if the request fails.
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
     Sends a GET request to retrieve limited user exercises.
     
     - Parameter userId: The user ID associated with the exercises.
     - Returns: An array of Exercise objects if successful.
     - Throws: An APIError if the request fails.
     */
    func GETLimitedUserExercises(userId: String) async throws -> [Exercise] {
        if (userId.isEmpty) { throw APIError.emptyParameter(parameterName: "userId") }
        
        let request = prepareGETLimitedUserExercisesRequest(userId: userId)
        do {
            // Try to get the User Exercise
            return try await handleGETLimitedUserExercisesResponse(inRequest: request)
        } catch {
            // Throw an Error if the GET request failed
            throw APIError.GETLimitedUserExercisesFailed(userId: userId)
        }
    }
    
    /**
     Sends a PUT request to process a user exercise with GPT.
     
     - Parameters:
        - userInput: The user input to be processed.
        - userId: The user ID associated with the exercise.
     - Returns: The ID of the processed exercise if successful, or nil otherwise.
     */
    func PUTUserExerciseWithGPT(userInput: String, userId: String) async -> String? {
        
        do {
            var request = try preparePUTUserExerciseWithGPTRequest(userId: userId)
            
            let requestBody: [String: Any] = [
                "userInput": userInput
            ]
            
            request.httpBody = try JSONSerialization.data(withJSONObject: requestBody)
            
            return try await handlePUTUserExerciseWithGPTResponse(inRequest: request)
        } catch {
            print("Error in PUTUserExerciseWithGPT: \(error)")
            return nil
        }
    }
    
    /**
     Sends a DELETE request to remove a user exercise.
     
     - Parameters:
        - userId: The user ID associated with the exercise.
        - exerciseId: The exercise ID to be removed.
     - Returns: A boolean indicating whether the operation was successful.
     */
    func DELETEUserExercise(userId: String, exerciseId: String) async -> Bool {
        do {
            // Prepare the request
            let request = prepareDELETEUserExerciseRequest(userId: userId, exerciseId: exerciseId)
            
            // Perform the async network operation
            let (data, _) = try await URLSession.shared.data(for: request)
            
            // Log the raw response data
            let responseString = String(data: data, encoding: .utf8) ?? "No data"
            print("Response Data: \(responseString)")
            
            // Parse the JSON response
            guard let jsonResponse = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
                print("Failed to parse JSON response")
                return false
            }
            
            print("Response: \(jsonResponse)")
            
            // Extract and parse the body
            guard let message = jsonResponse["message"] as? String else {
                print("Body or message not found in response")
                return false
            }
            
            return message.contains("success")
            
        } catch {
            print("Error handling DELETE user exercise response: \(error)")
            return false
        }
    }



    /**
     Prepares a URLRequest for a DELETE user exercise API request.
     
     - Parameters:
        - userId: The ID of the user.
        - exerciseId: The ID of the exercise.
     - Returns: A URLRequest object for the DELETE request.
     - Throws: An APIError if the parameters are invalid.
     */
    func prepareDELETEUserExerciseRequest(userId: String, exerciseId: String) -> URLRequest {
        let pathTemplate = getEnvironmentVariable(INVOKE_PATH_DELETE_USER_EXERCISE_PROD)!
        
        var path = pathTemplate.replacingOccurrences(of: "{userId}", with: userId)
        path = path.replacingOccurrences(of: "{exerciseId}", with: exerciseId)
        path = path.replacingOccurrences(of: "\"", with: "")
        
        guard let url = URL(string: path) else {
            fatalError("Invalid URL: \(path)")
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        request.addValue(getEnvironmentVariable(API_KEY_PROD)!, forHTTPHeaderField: "x-api-key")
        
        return request
    }



    /**
     Prepares a URLRequest for a PUT user exercise with GPT API request.
     
     - Parameter userId: The ID of the user.
     - Returns: A URLRequest object for the PUT request.
     - Throws: An APIError if the user ID is invalid.
     */
    func preparePUTUserExerciseWithGPTRequest(userId: String) throws -> URLRequest {
        if userId.isEmpty {
            throw APIError.emptyParameter(parameterName: "userId")
        }
        
        let pathTemplate: String = getEnvironmentVariable(INVOKE_PATH_PUT_USER_EXERCISE_GPT_PROD)!
        
        var path: String = pathTemplate.replacingOccurrences(of: "{userId}", with: userId)
        path = path.replacingOccurrences(of: "\"", with: "")

        guard let url = URL(string: path) else {
            fatalError("Invalid URL: \(path)")
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(getEnvironmentVariable(API_KEY_PROD)!, forHTTPHeaderField: "x-api-key")
        
        return request
    }

    /**
     Prepares a URLRequest for a GET limited user exercises API request.
     
     - Parameter userId: The ID of the user.
     - Returns: A URLRequest object for the GET request.
     */
    func prepareGETLimitedUserExercisesRequest(userId: String) -> URLRequest {
        let pathTemplate = getEnvironmentVariable(INVOKE_PATH_GET_USER_EXERCISES_PROD)!
        
        var path = pathTemplate.replacingOccurrences(of: "{userId}", with: userId)
        path = path.replacingOccurrences(of: "\"", with: "")

        
        guard let url = URL(string: path) else {
            fatalError("Invalid URL: \(path)")
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue(getEnvironmentVariable(API_KEY_PROD)!, forHTTPHeaderField: "x-api-key")
        return request
    }
    
    /**
     Prepares a URLRequest for a GET user exercise API request.
     
     - Parameters:
        - userId: The ID of the user.
        - exerciseId: The ID of the exercise.
     - Returns: A URLRequest object for the GET request.
     */
    func prepareGETUserExerciseRequest(userId: String, exerciseId: String) -> URLRequest {
        let pathTemplate: String = getEnvironmentVariable(INVOKE_PATH_GET_USER_EXERCISE_PROD)!
        
        var path: String = pathTemplate.replacingOccurrences(of: "{userId}", with: userId)
        path = path.replacingOccurrences(of: "{exerciseId}", with: exerciseId)
        path = path.replacingOccurrences(of: "\"", with: "")
        
        guard let url = URL(string: path) else {
            fatalError("Invalid URL: \(path)")
        }
        print("URL", url)
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue(getEnvironmentVariable(API_KEY_PROD)!, forHTTPHeaderField: "x-api-key")
        return request
    }
    
    /**
     Prepares a URLRequest for a PUT user exercise API request with an exercise ID.
     
     - Parameters:
        - userId: The ID of the user.
        - exerciseId: The ID of the exercise.
     - Returns: A URLRequest object for the PUT request.
     - Throws: An APIError if the parameters are invalid.
     */
    func preparePUTUserExerciseRequest(userId: String, exerciseId: String) throws -> URLRequest {
        if (userId.isEmpty) { throw APIError.emptyParameter(parameterName: "userId") }
        if (exerciseId.isEmpty) { throw APIError.emptyParameter(parameterName: "userId") }

        let pathTemplate = getEnvironmentVariable(INVOKE_PATH_PUT_USER_EXERCISE_WITH_EXERCISE_ID_PROD)!
        
        var path = pathTemplate.replacingOccurrences(of: "{userId}", with: userId)
        path = path.replacingOccurrences(of: "{exerciseId}", with: exerciseId)
        path = path.replacingOccurrences(of: "\"", with: "")
        
        guard let url = URL(string: path) else {
            fatalError("Invalid URL: \(path)")
        }
        
        // Create a URLRequest with the URL + Set the HTTP method to PUT
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        
        // Set the API key in the request headers
        request.addValue(getEnvironmentVariable(API_KEY_PROD)!, forHTTPHeaderField: "x-api-key")
        return request
    }
    
    /**
     Prepares a URLRequest for a PUT user exercise API request without an exercise ID.
     
     - Parameter userId: The ID of the user.
     - Returns: A URLRequest object for the PUT request.
     - Throws: An APIError if the user ID is invalid.
     */
    func preparePUTUserExerciseRequest(userId: String) throws -> URLRequest {
        if (userId.isEmpty) { throw APIError.emptyParameter(parameterName: "userId") }
        print("Here 1")

        let pathTemplate = getEnvironmentVariable(INVOKE_PATH_PUT_USER_EXERCISE_PROD)!
        
        var path = pathTemplate.replacingOccurrences(of: "{userId}", with: userId)
        path = path.replacingOccurrences(of: "\"", with: "")

        print("Here 2")

        guard let url = URL(string: path) else {
            fatalError("Invalid URL: \(path)")
        }
        
        // Create a URLRequest with the URL + Set the HTTP method to PUT
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        
        // Set the API key in the request headers
        request.addValue(getEnvironmentVariable(API_KEY_PROD)!, forHTTPHeaderField: "x-api-key")
        return request
    }
    
    /**
     Prepares JSON data for a PUT user exercise API request.
     
     - Parameters:
        - name: The name of the exercise.
        - type: The type of the exercise as a string.
        - attributes: The attributes of the exercise.
        - notes: Any notes associated with the exercise.
     - Returns: A dictionary representing the JSON data.
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
        
        let jsonObject: [String: Any] = [
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
        
        return jsonObject
    }

    /**
     Adds JSON data to a URLRequest for a PUT user exercise API request.
     
     - Parameters:
        - inRequest: The original URLRequest object.
        - jsonObject: The JSON data to be added to the request.
     - Returns: A URLRequest object with the JSON data added.
     - Throws: An error if JSON serialization fails.
     */
    func preparePUTUserExerciseRequestData(inRequest: URLRequest, jsonObject: [String: Any]) throws -> URLRequest {
        let jsonData = try JSONSerialization.data(withJSONObject: jsonObject, options: [])
        // Set the request body with the JSON data
        var outRequest = inRequest
        outRequest.httpBody = jsonData
        outRequest.addValue("application/json", forHTTPHeaderField: "Content-Type") // Ensure content type is set
        print("Here 3")
        return outRequest
    }


    /**
     Handles the response for a PUT user exercise API request.
     
     - Parameters:
        - inRequest: The URLRequest object for the PUT request.
        - jsonObject: The JSON data sent in the request.
     - Returns: The ID of the updated exercise if successful, or nil otherwise.
     */
    func handlePUTUserExerciseResponse(inRequest: URLRequest, jsonObject: [String: Any]) async -> String? {
        print("Here 4")
        // Perform the async network operation, e.g., using URLSession
        do {
            let (data, _) = try await URLSession.shared.data(for: inRequest)
            // Parse the data to extract the exercise ID
            if let jsonResponse = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
               let exerciseId = jsonResponse["exerciseId"] as? String {
                print("Here 5")
                return exerciseId
            } else {
                print("Here 6")
                return nil
            }
        } catch {
            // Handle error appropriately
            print("Error handling PUT user exercise response: \(error)")
            return nil
        }
    }

    /**
     Handles the response for a GET limited user exercises API request.
     
     - Parameter inRequest: The URLRequest object for the GET request.
     - Returns: An array of Exercise objects if successful.
     - Throws: An APIError if the request fails.
     */
    func handleGETLimitedUserExercisesResponse(inRequest: URLRequest) async throws -> [Exercise] {
        do {
            let (data, _) = try await URLSession.shared.data(for: inRequest)
            
            // Parse JSON response
            let jsonResponse = try JSONSerialization.jsonObject(with: data) as? [String: Any] ?? [:]
            print("JSON Response:")
            print(jsonResponse)
            if let error = jsonResponse["error"] as? String {
                print("Error: \(error)")
            }
            
            // Print JSON response details (optional)
            if let exercisesJSON = jsonResponse["exercises"] as? [[String: Any]] {
                print("GET Limited User Exercises: \(exercisesJSON.count) exercises found")
                
                // Convert JSON exercises to Exercise objects
                let convertedExercises: [Exercise] = try exercisesJSON.map { exerciseJSON in
                    let exerciseBody: [String: Any] = ["exercise": exerciseJSON]
                    let convertedExercise: Exercise = try ExerciseConverter().convertExerciseJSONResponseToExercise(exerciseBody)
                    return convertedExercise
                }
                
                // Return the list of Exercise objects
                return convertedExercises
            }
            
            // If exercises JSON is not found, throw an error
            throw APIError.GETUserExerciseFailedResponse
        } catch {
            // Handle network or JSON parsing errors
            print("Error handling GET user exercise response: \(error)")
            throw error
        }
    }

    /**
     Handles the response for a GET user exercise API request.
     
     - Parameter inRequest: The URLRequest object for the GET request.
     - Returns: An Exercise object if successful.
     - Throws: An APIError if the request fails.
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
     Handles the response for a PUT user exercise with GPT API request.
     
     - Parameter inRequest: The URLRequest object for the PUT request.
     - Returns: The ID of the processed exercise if successful, or nil otherwise.
     - Throws: An error if the request fails.
     */
    func handlePUTUserExerciseWithGPTResponse(inRequest: URLRequest) async -> String? {
        do {
            let (data, _) = try await URLSession.shared.data(for: inRequest)
                        
            // Parse the data to extract the exercise ID
            if let jsonResponse = try JSONSerialization.jsonObject(with: data) as? [String: Any],
               let exerciseId = jsonResponse["exerciseId"] as? String {
                // print("JSON Response", jsonResponse)
                return exerciseId
            } else {
                return nil
            }
        } catch {
            // Handle error appropriately
            print("Error handling PUT user exercise with GPT response: \(error)")
            return nil
        }
    }
    
}
