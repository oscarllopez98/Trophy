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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // Call buttonClicked() when the view controller appears
        // You can remove this if you want to trigger buttonClicked() from elsewhere
        buttonClicked()
    }
    
    // Your button action
    @IBAction func buttonClicked() {
        
        // Create and configure view data for the modal
        let modalView = ExerciseModalView(modalTitle: "Exercise Modal")
        
        // Instantiate modal view controller and set its modal view
        let exerciseModalViewController = ExerciseModalViewController()
        exerciseModalViewController.modalView = modalView
        
        exerciseModalViewController.modalPresentationStyle = .overFullScreen
        present(exerciseModalViewController, animated: true, completion: nil)
    }
    
}
