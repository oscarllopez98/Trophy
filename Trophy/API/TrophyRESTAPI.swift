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
        //TODO: Implement API function that will return something that we can test
        client.rootGet(op: "+", a: "1", b: "2").continueWith { (task) -> AnyObject? in
            print(task)
            self.showResult(task: task)
            return nil
        }
    }
    
    func showResult(task: AWSTask<AnyObject>) {
        if let error = task.error {
            print("Error: \(error)")
        } else if let result = task.result {
            if result is TROPHYResult {
                let res = result as! TROPHYResult
                print(String(format:"%@ %@ %@ = %@", res.input!.a!, res.input!.op!, res.input!.b!, res.output!.c!))
            } else if result is NSDictionary {
                let res = result as! NSDictionary
                print("NSDictionary: \(res)")
            }
        }
    }
    

}
