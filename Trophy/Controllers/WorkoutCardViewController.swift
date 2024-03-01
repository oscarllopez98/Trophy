//
//  WorkoutCardViewController.swift
//  Trophy
//
//  Created by Oscar Lopez on 2/28/24.
//

import Foundation

class WorkoutCardViewController: ObservableObject {
    
    var viewModel: WorkoutViewModel?
    
    //We use this function whenever we're changing something within the WorkoutViewModel
    func configure(with viewModel: WorkoutViewModel) {
        self.viewModel = viewModel
    }
    
    func sayHi() {
        print("WorkoutCardView Clicked!")
    }
    
    func printTestWorkoutName() {
        let name: String = viewModel?.getName() ?? "No Name!"
        print(name)
    }
    
}
