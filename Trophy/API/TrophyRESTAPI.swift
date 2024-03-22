//
//  TrophyRESTAPI.swift
//  Trophy
//
//  Created by Oscar Lopez on 3/22/24.
//

import Foundation
import AWSAPIGateway

class TrophyRESTAPI {

    let client = TROPHYTrophyRESTAPIClient.default()
    
    func testAPICall() {

        //Call the Get Exercises API
        client.exercisesGet().continueWith { (task) -> Any? in
            if let error = task.error {
                print("Error: \(error)")
            } else {
                print("Reqeuest succeeded but no data was returned.")
            }
            return nil
        }
    }
    

}
