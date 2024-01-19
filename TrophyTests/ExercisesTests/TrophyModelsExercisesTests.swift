//
//  TrophyModelsExercisesTests.swift
//  TrophyTests
//
//  Created by Oscar Lopez on 12/23/23.
//

import XCTest
@testable import Trophy

final class TrophyModelsExercisesTests: XCTestCase {

    //MARK: Initialization Tests
    
    //Test Exercise Type: running
    func testExerciseInitializationRunning() {
        let id = UUID()
        let name = "My Running Exercise"
        let type = ExerciseType.running
        
        let attributes = [
            DistanceAttribute(distance: 3.1, unit: DistanceUnit(distanceSymbol: .mi)),
            TimeAttribute(time: 60 * 20)
        ]
        
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let formattedDate = dateFormatter.string(from: date)
        
        let exercise = Exercise(id: id, name: name, type: type, attributes: attributes, date: date)
        
        XCTAssertEqual(exercise.id, id)
        XCTAssertEqual(exercise.name, name)
        XCTAssertEqual(exercise.type, type)
        XCTAssertEqual(exercise.attributes, attributes)
        XCTAssertEqual(dateFormatter.string(from: exercise.date), formattedDate)
        XCTAssertNil(exercise.duration)
        XCTAssertNil(exercise.notes)
    }
    
    //Test Exercise Type: strength
    func testExerciseInitializationStrength() {
        let id = UUID()
        let name = "My Strength Exercise"
        let type = ExerciseType.strength
        
        let attributes = [
            SetsAttribute(sets: 4),
            RepsAttribute(reps: 6),
            WeightAttribute(weight: 125, unit: WeightUnit(weightSymbol: .lb))
        ]
        
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let formattedDate = dateFormatter.string(from: date)
        
        let duration: TimeInterval = 60 * 10
        
        let exercise = Exercise(id: id, name: name, type: type, attributes: attributes, date: date, duration: duration)

        XCTAssertEqual(exercise.id, id)
        XCTAssertEqual(exercise.name, name)
        XCTAssertEqual(exercise.type, type)
        XCTAssertEqual(exercise.attributes, attributes)
        XCTAssertEqual(dateFormatter.string(from: exercise.date), formattedDate)
        XCTAssertEqual(exercise.duration, duration)
        XCTAssertNil(exercise.notes)
    }
    
    //Test Exercise Type: flexibility
    func testExerciseInitializationFlexibility() {
        let id = UUID()
        let name = "My Flexibility Exercise"
        let type = ExerciseType.flexibility
        
        let attributes = [
            TimeAttribute(time: 60 * 45),
            IntensityAttribute(value: .high)
        ]
        
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let formattedDate = dateFormatter.string(from: date)
        
        let duration: TimeInterval = 60 * 10
        
        let notes = "Here are some notes!"
        
        let exercise = Exercise(id: id, name: name, type: type, attributes: attributes, date: date, duration: duration, notes: notes)
        

        XCTAssertEqual(exercise.id, id)
        XCTAssertEqual(exercise.name, name)
        XCTAssertEqual(exercise.type, type)
        XCTAssertEqual(exercise.attributes, attributes)
        XCTAssertEqual(dateFormatter.string(from: exercise.date), formattedDate)
        XCTAssertEqual(exercise.duration, duration)
        XCTAssertEqual(exercise.notes, notes)
        
    }
    
    //Test all attributes together
    func testExerciseInitializationAllExerciseAttributes() {
        let id = UUID()
        let name = "My Crazy Exercise"
        let type = ExerciseType.other
        
        let attributes = [
            UserDefinedAttribute(name: "Something", value: "Value", unit: nil),
            DistanceAttribute(distance: 100, unit: DistanceUnit(distanceSymbol: .yd)),
            TimeAttribute(time: 60 * 1.5),
            SetsAttribute(sets: 3),
            RepsAttribute(reps: 1),
            WeightAttribute(weight: 25, unit: WeightUnit(weightSymbol: .kg)),
            IntensityAttribute(value: .high),
            LevelAttribute(value: .ten)
        ]
        
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let formattedDate = dateFormatter.string(from: date)
        
        let duration: TimeInterval = 60 * 10
        
        let notes = "Here are some notes!"
        
        let exercise = Exercise(id: id, name: name, type: type, attributes: attributes, date: date, duration: duration, notes: notes)
        

        XCTAssertEqual(exercise.id, id)
        XCTAssertEqual(exercise.name, name)
        XCTAssertEqual(exercise.type, type)
        XCTAssertEqual(exercise.attributes, attributes)
        XCTAssertEqual(dateFormatter.string(from: exercise.date), formattedDate)
        XCTAssertEqual(exercise.duration, duration)
        XCTAssertEqual(exercise.notes, notes)
        
        dump(exercise)
    }
    
    //MARK: Equality Tests - No Property Changes

    //Test two references to the same Exercise ID are equal
    func testExercisesEqual() {
        let id = UUID()
        let name = "My Running Exercise"
        let type = ExerciseType.running
        
        let attributes = [
            DistanceAttribute(distance: 3.1, unit: DistanceUnit(distanceSymbol: .mi)),
            TimeAttribute(time: 60 * 20)
        ]
        
        let date = Date()
        
        let exercise = Exercise(id: id, name: name, type: type, attributes: attributes, date: date)
        
        let copyExercise = exercise
        
        XCTAssertEqual(copyExercise, exercise)
    }
    
    //Test Exercise with different IDs are not equal
    func testExercisesNotEqual() {
        let id = UUID()
        let name = "My Running Exercise"
        let type = ExerciseType.running
        
        let attributes = [
            DistanceAttribute(distance: 3.1, unit: DistanceUnit(distanceSymbol: .mi)),
            TimeAttribute(time: 60 * 20)
        ]
        
        let date = Date()
        
        let exercise = Exercise(id: id, name: name, type: type, attributes: attributes, date: date)
        
        let temp_id = UUID()
        let temp_name = "My Running Exercise"
        let temp_type = ExerciseType.running
        
        let temp_attributes = [
            DistanceAttribute(distance: 3.1, unit: DistanceUnit(distanceSymbol: .mi)),
            TimeAttribute(time: 60 * 20)
        ]
        
        let temp_date = Date()
        
        let tempExercise = Exercise(id: temp_id, name: temp_name, type: temp_type, attributes: temp_attributes, date: temp_date)
        
        XCTAssertNotEqual(tempExercise, exercise)
    }

    //Test Exercise is not equal to nil Exercise
    func testExercisesOneNilNotEqual() {
        let id = UUID()
        let name = "My Running Exercise"
        let type = ExerciseType.running
        
        let attributes = [
            DistanceAttribute(distance: 3.1, unit: DistanceUnit(distanceSymbol: .mi)),
            TimeAttribute(time: 60 * 20)
        ]
        
        let date = Date()
        
        let exercise = Exercise(id: id, name: name, type: type, attributes: attributes, date: date)
        
        let copyExercise: Exercise? = nil
        
        XCTAssertNotEqual(copyExercise, exercise)
    }
    
    //MARK: Attribute Appending + Removing Tests
    
    //Test adding an Attribute increases attributes[] length
    func testExerciseAttributesAppend() {
        let id = UUID()
        let name = "My Running Exercise"
        let type = ExerciseType.running
        
        var attributes = [
            DistanceAttribute(distance: 3.1, unit: DistanceUnit(distanceSymbol: .mi)),
            TimeAttribute(time: 60 * 20)
        ]
        
        let attributesLength = attributes.count
        
        attributes.append(WeightAttribute(weight: 120, unit: WeightUnit(weightSymbol: .kg)))
        
        let date = Date()
        
        let exercise = Exercise(id: id, name: name, type: type, attributes: attributes, date: date)
                
        XCTAssertEqual(exercise.attributes.count, attributesLength+1)
    }
    
    //Test removing an Attribute decreases attributes[] length
    func testExerciseAttributesRemoval() {
        let id = UUID()
        let name = "My Running Exercise"
        let type = ExerciseType.running
        
        var attributes = [
            DistanceAttribute(distance: 3.1, unit: DistanceUnit(distanceSymbol: .mi)),
            TimeAttribute(time: 60 * 20)
        ]
        
        let attributesLength = attributes.count
        
        attributes.removeLast()
                
        let date = Date()
        
        let exercise = Exercise(id: id, name: name, type: type, attributes: attributes, date: date)
                
        XCTAssertEqual(exercise.attributes.count, attributesLength-1)
    }
    

    
}
