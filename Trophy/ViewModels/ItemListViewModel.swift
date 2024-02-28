//
//  ItemListViewModel.swift
//  Trophy
//
//  Created by Oscar Lopez on 2/27/24.
//

import Foundation


/***
 Test class for adding to a list in Swift
 */
class ItemListViewModel {
    private var items: [String] = []

    // Define the updateHandler closure property
    var updateHandler: (() -> Void)?

    // Method to add an item to the list
    func addItem(_ item: String) {
        items.append(item)
        // Call the updateHandler closure to notify observers about changes
        updateHandler?()
    }

    // Method to remove an item from the list
    func removeItem(at index: Int) {
        items.remove(at: index)
        // Call the updateHandler closure to notify observers about changes
        updateHandler?()
    }

    // Method to retrieve the list of items
    func getItems() -> [String] {
        return items
    }
}

