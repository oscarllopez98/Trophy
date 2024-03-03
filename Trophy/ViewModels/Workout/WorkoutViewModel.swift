//
//  WorkoutViewModel.swift
//  Trophy
//
//  Created by Oscar Lopez on 3/1/24.
//

import Foundation

class WorkoutViewModel: ObservableObject {
    
    let id: UUID
    let name: String
    let exercises: [Exercise]
    let date: Date
    let duration: TimeInterval?
    let notes: String?
    
    init(id: UUID, name: String, exercises: [Exercise], date: Date, duration: TimeInterval?, notes: String?) {
        self.id = id
        self.name = name
        self.exercises = exercises
        self.date = date
        self.duration = duration
        self.notes = notes
    }
    
    
    //MARK: Getters ID
    func getID() -> UUID {
        id
    }
    
    func getIDAsString() -> String {
        id.uuidString
    }
    
    
    //MARK: Getters Name
    func getName() -> String {
        name
    }
    
    
    //MARK: Getters Exercises
    func getExercises() -> [Exercise] {
        exercises
    }
    
    
    //MARK: Getters Date
    func getDate() -> Date {
        date
    }
    
    func getDateFormatted() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMMM YYYY"
        
        let formattedDate = dateFormatter.string(from: date)
        return formattedDate
    }
    
    
    //MARK: Getters Duration
    func getDuration() -> TimeInterval? {
        duration ?? nil
    }
    
    func getDuration_HHMMSS() -> String? {
        //Check if our duration is set
        if let timeInterval = duration {
            
            let formatter = DateComponentsFormatter()
            formatter.allowedUnits = [.hour, .minute, .second]
            formatter.unitsStyle = .positional
            formatter.zeroFormattingBehavior = .pad
            
            if let formattedString = formatter.string(from: timeInterval) {
                return formattedString
            } else {
                return nil
            }
        }
        
        //Else, duration is nil, so return nil
        else {
            return nil
        }
    }
    
    func getDuration_HHMM() -> String? {
        //Check if our duration is set
        if let timeInterval = duration {
            
            let formatter = DateComponentsFormatter()
            formatter.allowedUnits = [.hour, .minute]
            formatter.unitsStyle = .positional
            formatter.zeroFormattingBehavior = .pad
            
            if let formattedString = formatter.string(from: timeInterval) {
                return formattedString
            } else {
                return nil
            }
        }
        
        //Else, duration is nil, so return nil
        else {
            return nil
        }
    }
    
    func getDuration_MMSS() -> String? {
        //Check if our duration is set
        if let timeInterval = duration {
            
            let formatter = DateComponentsFormatter()
            formatter.allowedUnits = [.minute, .second]
            formatter.unitsStyle = .positional
            formatter.zeroFormattingBehavior = .pad
            
            if let formattedString = formatter.string(from: timeInterval) {
                return formattedString
            } else {
                return nil
            }
        }
        
        //Else, duration is nil, so return nil
        else {
            return nil
        }
    }
    
    
    //MARK: Getters Notes
    func getNotes() -> String? {
        notes ?? nil
    }

}


extension WorkoutViewModel {
    static func sample() -> WorkoutViewModel {
        
        let id = UUID()
        let name = "Sample Preview Workout"
        let exercises: [Exercise] = ExerciseFactory.shared.createTestExerciseList(numExercises: 3)
        let date = Date()
        let duration: TimeInterval? = 60*60
        let notes: String? = "Sample Preview Notes"
        
        return WorkoutViewModel(id: id,
                         name: name,
                         exercises: exercises,
                         date: date,
                         duration: duration,
                         notes: notes)
    }
}
