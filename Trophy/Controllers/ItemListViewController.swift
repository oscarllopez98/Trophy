//
//  ItemListViewController.swift
//  Trophy
//
//  Created by Oscar Lopez on 2/27/24.
//

/***
 Test Controller class */
import UIKit

class ItemListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    var viewModel = ItemListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Bind the table view to the list of items in the ViewModel
        viewModel.updateHandler = { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    @IBAction func addButtonTapped(_ sender: UIButton) {
        // Logic to handle adding an item
        viewModel.addItem("New Item")
    }

    @IBAction func deleteButtonTapped(_ sender: UIButton) {
        // Logic to handle deleting an item
        if let indexPath = tableView.indexPathForSelectedRow {
            viewModel.removeItem(at: indexPath.row)
        }
    }

    // Other methods for handling user interactions, etc.
}
