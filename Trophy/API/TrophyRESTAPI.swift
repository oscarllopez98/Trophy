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
    func testAPICall() {        
        // Create a URL for your API endpoint
        let endpointPath = "/users/4bf0e7ef-cd19-4b0c-b9a2-e946c58e01d1/exercises"
        let url = URL(string: "https://xhh2wpxj6f.execute-api.us-east-1.amazonaws.com/Prod" + endpointPath)!

        // Create a URLRequest with the URL
        var request = URLRequest(url: url)

        // Set the HTTP method to POST (or PUT, DELETE, etc. depending on your API)
        request.httpMethod = "PUT"

        // Set the content type header to indicate that the request body contains JSON data
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        // Set the API key in the request headers
        request.setValue("eJft9CvQjC9WqubQzLaFS7rAPrjRWCKt99QuLHAm", forHTTPHeaderField: "x-api-key")
        
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
                    "level": ["value": "8"]
                ],
                "notes": "This is from my iOS App!"
            ]
        ]
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: jsonObject, options: [])

            // Set the request body with the JSON data
            request.httpBody = jsonData

            // Create a URLSessionDataTask to make the request
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
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
