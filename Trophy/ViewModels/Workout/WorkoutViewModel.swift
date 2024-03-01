//
//  WorkoutViewModel.swift
//  Trophy
//
//  Created by Oscar Lopez on 3/1/24.
//

import Foundation

class WorkoutViewModel {
    
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
    
    
    //MARK: Getters Duration
    func getDuration() -> TimeInterval? {
        duration ?? 0
    }
    
    
    //MARK: Getters Notes
    func getNotes() -> String? {
        notes ?? ""
    }

}
