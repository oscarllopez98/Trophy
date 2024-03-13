//
//  TimeInputViewModel.swift
//  Trophy
//
//  Created by Oscar Lopez on 3/12/24.
//

import Foundation

class TimeInputViewModel: ObservableObject {
    //Properties to hold the State
    @Published var selectedHours: Int
    @Published var selectedMinutes: Int
    @Published var selectedSeconds: Int
    
    let hoursNumbers = Array((0...23).reversed())
    let minutesNumbers = Array((0...59).reversed())
    let secondsNumbers = Array((0...59).reversed())
    
    init(selectedHours: Int = 0, selectedMinutes: Int = 0, selectedSeconds: Int = 0) {
        self.selectedHours = selectedHours
        self.selectedMinutes = selectedMinutes
        self.selectedSeconds = selectedSeconds
    }
    
    //Function to update the selected Hours
    func updateHours(_ hours: Int) {
        selectedHours = hours
    }
    
    //Function to update the selected Minutes
    func updateMinutes(_ minutes: Int) {
        selectedMinutes = minutes
    }
    
    //Function to update the selected Seconds
    func updateSeconds(_ seconds: Int) {
        selectedSeconds = seconds
    }
    
}
