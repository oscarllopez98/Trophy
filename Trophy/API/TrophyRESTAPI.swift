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
     
     - Parameter exercise: The exercise object to be updated.
     - Returns: The ID of the updated exercise if successful, or nil otherwise.
     */
    func PUTUserExercise(exercise: Exercise) async -> String? {
        do {
            // Prepare request depending if we have an Exercise ID or not
            let request = exercise.id != nil ? try preparePUTUserExerciseRequest(userId: "4bf0e7ef-cd19-4b0c-b9a2-e946c58e01d1", exerciseId: exercise.id!.uuidString)
            : try preparePUTUserExerciseRequest(userId: "4bf0e7ef-cd19-4b0c-b9a2-e946c58e01d1")
            
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

    private func prepareGETLimitedUserExercisesRequest(userId: String) -> URLRequest {
        let path = "https://xhh2wpxj6f.execute-api.us-east-1.amazonaws.com/Development/users/\(userId)/exercises"
        guard let url = URL(string: path) else {
            fatalError("Invalid URL: \(path)")
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("eJft9CvQjC9WqubQzLaFS7rAPrjRWCKt99QuLHAm", forHTTPHeaderField: "x-api-key")
        return request
    }
    
    /**
     Prepares a URLRequest for a GET user exercise API request.
     
     - Parameters:
        - userId: The ID of the user.
        - exerciseId: The ID of the exercise.
     - Returns: A URLRequest object for the GET request.
     */
    private func prepareGETUserExerciseRequest(userId: String, exerciseId: String) -> URLRequest {
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
     - Throws: An APIError if the parameters are invalid.
     */
    private func preparePUTUserExerciseRequest(userId: String, exerciseId: String) throws -> URLRequest {
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
    
    /**
     Prepares a URLRequest for a PUT user exercise API request without an exercise ID.
     
     - Parameter userId: The ID of the user.
     - Returns: A URLRequest object for the PUT request.
     - Throws: An APIError if the user ID is invalid.
     */
    private func preparePUTUserExerciseRequest(userId: String) throws -> URLRequest {
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
     Prepares a URLRequest for a PUT user exercise API request without user and exercise IDs.
     
     - Returns: A URLRequest object for the PUT request.
     */
    private func preparePUTUserExerciseRequest() -> URLRequest {
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
        - name: The name of the exercise.
        - type: The type of the exercise.
        - attributes: The attributes of the exercise.
        - notes: Any notes associated with the exercise.
     - Returns: A dictionary representing the JSON payload.
     */
    private func preparePUTUserExerciseJSON(name: String,
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
     Prepares the URLRequest data for a PUT user exercise API request.
     
     - Parameters:
        - inRequest: The input URLRequest.
        - jsonObject: The JSON object to be included in the request body.
     - Returns: A URLRequest object with the JSON data set as the HTTP body.
     - Throws: An error if there is an issue creating the JSON data.
     */
    private func preparePUTUserExerciseRequestData(inRequest: URLRequest, jsonObject: [String: Any]) throws -> URLRequest {
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
    private func getPUTUserExerciseEndpointPath() -> URL {
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
    private func handlePUTUserExerciseResponse(inRequest: URLRequest, jsonObject: [String: Any]) async -> String? {
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

    private func handleGETLimitedUserExercisesResponse(inRequest: URLRequest) async throws -> [Exercise] {
        // Perform the async network operation, e.g., using URLSession
        do {
            let (data, _) = try await URLSession.shared.data(for: inRequest)
            // Handle the data appropriately
            if let jsonResponse = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
               let exercises = jsonResponse["exercises"] as? [[String: Any]] {
                // Process the JSON response
                print("GET Limited User Exercises: \(exercises.count) exercises found")

                // Convert each Exercise JSON into an Exercise object to create a list of Exercise objects
                let convertedExercises: [Exercise] = try exercises.map { exercise in
                    let exerciseBody: [String: Any] = ["exercise" : exercise]
                    let convertedExercise: Exercise = try ExerciseConverter().convertExerciseJSONResponseToExercise(exerciseBody)
                    return convertedExercise
                }
                // Return the list of Exercise objects
                return convertedExercises
            }
        } catch {
            // Handle error appropriately
            print("Error handling GET user exercise response: \(error)")
        }
        throw APIError.GETUserExerciseFailedResponse
    }

    /**
     Constructs the URL for the GET user exercise API endpoint.
     
     - Parameters:
        - userId: The ID of the user.
        - exerciseId: The ID of the exercise.
     - Returns: The URL for the API endpoint.
     */
    private func handleGETUserExerciseResponse(inRequest: URLRequest) async throws -> Exercise {
        // Perform the async network operation, e.g., using URLSession
        do {
            let (data, _) = try await URLSession.shared.data(for: inRequest)
            // Handle the data appropriately
            if let jsonResponse = try? JSONSerialization.jsonObject(with: data) as? [String: Any] {
                // Process the JSON response
//                print("GET User Exercise response: \(jsonResponse)")
                return try ExerciseConverter().convertExerciseJSONResponseToExercise(jsonResponse)
            }
        } catch {
            // Handle error appropriately
            print("Error handling GET user exercise response: \(error)")
        }
        throw APIError.GETUserExerciseFailedResponse
    }
    

}
