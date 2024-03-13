//
//  RepsInputViewModel.swift
//  Trophy
//
//  Created by Oscar Lopez on 3/12/24.
//

import Foundation

class RepsInputViewModel: ObservableObject {
    //State variables for tracking:
    @Published var selectedReps: String    //Reps value
    
    init(selectedReps: String = "") {
        self.selectedReps = selectedReps
    }
    
    func updateSelectedReps(_ reps: String) {
        selectedReps = reps
    }
}
