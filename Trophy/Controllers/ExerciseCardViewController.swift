//
//  ExerciseCardViewController.swift
//  Trophy
//
//  Created by Oscar Lopez on 2/28/24.
//

import UIKit

class ExerciseCardViewController: UIViewController {
    
    var viewModel: ExerciseViewModel?
    
    //We use this function whenever we're changing something within the ExerciseViewModel
    func configure(with viewModel: ExerciseViewModel) {
        self.viewModel = viewModel
    }
    
    func sayHi() {
        print("ExerciseCardView Clicked!")
    }
    
    func printTestExerciseName() {
        let name: String = viewModel?.getName() ?? "No Name!"
        print(name)
    }

    
}
