//
//  ExerciseFactory.swift
//  Trophy
//
//  Created by Oscar Lopez on 2/27/24.
//

import Foundation

class ExerciseFactory {
    // Singleton instance
    static let shared = ExerciseFactory()
    
    private init() {}
    
    func createTestExercise() -> Exercise {
        let id = UUID()
        return Exercise(id: id,
                        name: "Test Exercise!",
                        type: .other,
                        attributes: [.level: LevelAttribute(value: .five)],
                        date: Date(),
                        duration: 10,
                        notes: "These are the notes of my Test Exercise :)")
    }
    
    func createTestExerciseV2() -> Exercise {
        return Exercise(name: "Test Exercise V2",
                        type: .other,
                        attributes: [.level: LevelAttribute(value: .five)],
                        date: Date(),
                        notes: "These are the notes of my Test Exercise :)")
    }
    
    func createTestExerciseV3() -> Exercise {
        return Exercise(name: "Test Exercise V3",
                        type: .cardio,
                        attributes: [
                            .distance : DistanceAttribute(distance: 100.50, unit: DistanceUnit(distanceSymbol: .km)),
                            .sets: RepsAttribute(reps: 10),
                            .time: TimeAttribute(time: 8000),
                            .weight: WeightAttribute(weight: 315, unit: WeightUnit(weightSymbol: .lb))
                        ],
                        date: .now)
    }
    
    func createTestExerciseList(numExercises: Int) -> [Exercise] {
        var exerciseList: [Exercise] = []
        for num in 0...numExercises-1 {
            let name = "Test Exercise \(num)"
            exerciseList.append(createTestExerciseWithName(name))
        }
        return exerciseList
    }
    
    func createTestExerciseWithName(_ name: String) -> Exercise {
        let id = UUID()
        return Exercise(id: id,
                        name: name,
                        type: .other,
                        attributes: [.level: LevelAttribute(value: .five)],
                        date: Date(),
                        duration: 10,
                        notes: "These are the notes of my Test Exercise :)")
    }
    
    func createNewExercise(name: String, type: ExerciseType, attributes: [Exercise.AttributeName: ExerciseAttribute], date: Date, duration: TimeInterval? = nil, notes: String? = nil) -> Exercise {
        let id = UUID()
        return Exercise(id: id,
                        name: name,
                        type: type,
                        attributes: attributes,
                        date: date,
                        duration: duration,
                        notes: notes)
    }
}
