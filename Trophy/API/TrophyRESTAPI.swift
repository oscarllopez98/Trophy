//
//  TrophyRESTAPI.swift
//  Trophy
//
//  Created by Oscar Lopez on 3/22/24.
//

import Foundation
import AWSAPIGateway

class TrophyRESTAPI {

    func testAPICall() {
        testAPICall(a: 10, b: 20, op: "+")
    }
    
    func testAPICall(a: NSNumber, b: NSNumber, op: String) {
        let client = TROPHYTrophyRESTAPIClient.default()
                
        // Create a TROPHYInput object
        var body = TROPHYInput()
        
        // Check if body is not nil before proceeding
        if let body = body {
            body.a = a
            body.b = b
            body.op = op
            
            // Call the API method with the unwrapped body
            client.rootPost(body: body).continueWith { (task: AWSTask<TROPHYResult>) -> AWSTask<TROPHYResult>? in
                self.showResult(task: task)
                return nil
            }
        } else {
            print("Failed to create Input body")
        }
    }
    

    func showResult(task: AWSTask<TROPHYResult>) {
        if let error = task.error {
            print("Error: \(error)")
        } else if let result = task.result {
            if let input = result.input, let output = result.output {
                print(String(format:"%@ %@ %@ = %@", input.a!, input.op!, input.b!, output.c!))
            } else {
                print("Input or output is nil")
            }
        }
    }
}
