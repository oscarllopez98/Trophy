//
//  ActionBarViewController.swift
//  Trophy
//
//  Created by Oscar Lopez on 3/12/24.
//

import Foundation

class ActionBarViewController {
    var viewModel: ActionBarViewModel?
    
    //We use this function whenever we're changing something within the ExerciseViewModel
    func configure(with viewModel: ActionBarViewModel) {
        self.viewModel = viewModel
    }
    
    func sayHi() {
        print("ActionBarView Clicked!")
    }
}
