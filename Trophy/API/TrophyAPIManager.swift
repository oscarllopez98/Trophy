//
//  TrophyAPIManager.swift
//  Trophy
//
//  Created by Oscar Lopez on 3/22/24.
//

import Foundation
import AWSAPIGateway

class TrophyAPIManagerr {

    let client = TROPHYTrophyRESTAPIClient.default()
    
    func testAPICall() {
        client.exercisesGet().continueWith { (task) -> AnyObject? in
            self.showResult(task: task)
            return nil
        }
    }
    
    func showResult(task: AWSTask<Empty>) {
        if let error = task.error {
            print("Error: \(error)")
        } else {
            print("Success")
        }
    }
    

}
