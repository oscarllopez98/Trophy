//
//  ExerciseModalViewController.swift
//  Trophy
//
//  Created by Oscar Lopez on 3/2/24.
//

import UIKit

class ExerciseModalViewController: UIViewController {
    
    var modalView: ExerciseModalView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        // Configure UI components using view data
        view.backgroundColor = .white
        
        let label = UILabel()
        label.text = modalView?.viewModel.name
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
