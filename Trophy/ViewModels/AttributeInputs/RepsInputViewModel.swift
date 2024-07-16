//
//  RepsInputViewModel.swift
//  Trophy
//
//  Created by Oscar Lopez on 3/12/24.
//

import Foundation

class RepsInputViewModel: ObservableObject {
    @Published var selectedReps: String {
        didSet {
            isEdited = true
        }
    }
    var isEdited: Bool = false
    
    init(selectedReps: String = "") {
        self.selectedReps = selectedReps
    }
    
    func updateSelectedReps(_ reps: String) {
        selectedReps = reps
    }
}
