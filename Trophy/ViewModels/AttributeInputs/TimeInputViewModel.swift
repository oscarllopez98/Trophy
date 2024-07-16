//
//  TimeInputViewModel.swift
//  Trophy
//
//  Created by Oscar Lopez on 3/12/24.
//

import Foundation

class TimeInputViewModel: ObservableObject {
    @Published var selectedHours: Int {
        didSet {
            isEdited = true
        }
    }
    @Published var selectedMinutes: Int {
        didSet {
            isEdited = true
        }
    }
    @Published var selectedSeconds: Int {
        didSet {
            isEdited = true
        }
    }
    var isEdited: Bool = false

    let hoursNumbers = Array((0...23).reversed())
    let minutesNumbers = Array((0...59).reversed())
    let secondsNumbers = Array((0...59).reversed())
    
    init(selectedHours: Int = 0, selectedMinutes: Int = 0, selectedSeconds: Int = 0) {
        self.selectedHours = selectedHours
        self.selectedMinutes = selectedMinutes
        self.selectedSeconds = selectedSeconds
    }
    
    func updateHours(_ hours: Int) {
        selectedHours = hours
    }
    
    func updateMinutes(_ minutes: Int) {
        selectedMinutes = minutes
    }
    
    func updateSeconds(_ seconds: Int) {
        selectedSeconds = seconds
    }
}
