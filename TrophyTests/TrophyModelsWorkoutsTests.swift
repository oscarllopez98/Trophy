//
//  TrophyModelsWorkoutsTests.swift
//  TrophyTests
//
//  Created by Oscar Lopez on 12/25/23.
//

import XCTest
@testable import Trophy

final class TrophyModelsWorkoutsTests: XCTestCase {

    var exercise: Exercise!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let id = UUID()
        let name = "My Test Exercise"
        let type = ExerciseType.other
        
        let attributes: [Exercise.AttributeName: ExerciseAttribute] = [
            .userDefined: UserDefinedAttribute(name: "Percent Effort", value: "85%", unit: nil),
            .distance: DistanceAttribute(distance: 100, unit: DistanceUnit(distanceSymbol: .yd)),
            .time: TimeAttribute(time: 60 * 1.5),
            .sets: SetsAttribute(sets: 3),
            .reps: RepsAttribute(reps: 1),
            .weight: WeightAttribute(weight: 25, unit: WeightUnit(weightSymbol: .kg)),
            .intensity: IntensityAttribute(value: .high),
            .level: LevelAttribute(value: .eight)
        ]
        
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let duration: TimeInterval = 60 * 12
        
        let notes = "Here are some notes!"
        
        super.setUp()
        exercise = Exercise(
            id: id,
            name: name,
            type: type,
            attributes: attributes,
            date: date,
            duration: duration,
            notes: notes
        )
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        exercise = nil
        super.tearDown()
    }
    
    func testWorkoutsInitializationMinimumProperties() throws {
        let id = UUID()
        let name = "My Test Workout"
        let date = Date()
        
        let workout = Workout(id: id,
                              name: name,
                              exercises: [exercise],
                              date: date)
        
        XCTAssertEqual(workout.id, id)
        XCTAssertEqual(workout.name, name)
        XCTAssertEqual(workout.date, date)
        XCTAssertEqual(workout.exercises[0], exercise)
        XCTAssertEqual(workout.duration, exercise.duration)
        XCTAssertNil(workout.notes)
    }
    
    func testWorkoutsInitializationOneExercise() throws {
        
        let id = UUID()
        let name = "My Test Workout"
        let date = Date()
        let notes = "Here are my Workout notes!"
        let exercises: [Exercise] = [exercise]
        //Determine the combined duration for every Exercise object
        let duration = exercises.reduce(0.0) { $0 + ($1.duration ?? 0) }
        
        let workout = Workout(id: id,
                              name: name,
                              exercises: exercises,
                              date: date,
                              duration: duration,
                              notes: notes)
        
        XCTAssertEqual(workout.id, id)
        XCTAssertEqual(workout.name, name)
        XCTAssertEqual(workout.date, date)
        XCTAssertEqual(workout.notes, notes)
        XCTAssertEqual(workout.exercises, exercises)
        XCTAssertEqual(workout.duration, duration)
        XCTAssertEqual(workout.notes, notes)

    }
    
    //MARK: Initialization Tests
    
    func testWorkoutsInitializationManyExercises() throws {
        
        let temp_id = UUID()
        let temp_name = "My Temp Exercise"
        let temp_type = ExerciseType.other
        let temp_attributes: [Exercise.AttributeName: ExerciseAttribute] = [
            .sets: SetsAttribute(sets: 4),
            .reps: RepsAttribute(reps: 6)
        ]
        let temp_date = Date()
        
        let tempExercise = Exercise(id: temp_id,
                                    name: temp_name,
                                    type: temp_type,
                                    attributes: temp_attributes,
                                    date: temp_date)
        
        
        let id = UUID()
        let name = "My Test Workout"
        let date = Date()
        let notes = "Here are my Workout notes!"
        let exercises: [Exercise] = [exercise, tempExercise]
        let duration = exercises.reduce(0.0) { $0 + ($1.duration ?? 0) }
        
        let workout = Workout(id: id,
                              name: name,
                              exercises: exercises,
                              date: date,
                              notes: notes)
        
        XCTAssertEqual(workout.id, id)
        XCTAssertEqual(workout.name, name)
        XCTAssertEqual(workout.date, date)
        XCTAssertEqual(workout.notes, notes)
        XCTAssertEqual(workout.exercises, exercises)
        XCTAssertEqual(workout.duration, duration)
        XCTAssertEqual(workout.notes, notes)
    }

}
