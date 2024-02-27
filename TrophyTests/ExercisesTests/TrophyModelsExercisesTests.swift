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
        
        //Arbitrary values used for Running test
        let id = UUID()
        let name = "My Running Exercise"
        //Not Arbitrary -- Must be included when initializing a Running Exercise
        let type = ExerciseType.running
        
        //Attributes I want to use in my test
        let attributes: [Exercise.AttributeName: ExerciseAttribute] =
        [
            .distance: DistanceAttribute(distance: 3.1, unit: DistanceUnit(distanceSymbol: .mi)),
            .time: TimeAttribute(time: 60 * 20)
        ]
        
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let formattedDate = dateFormatter.string(from: date)
        
        let exercise = Exercise(id: id, name: name, type: type, attributes: attributes, date: date)
        
        Exercise(id: id, name: name, type: type, attributes: attributes, date: date)
        
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
        
        let attributes: [Exercise.AttributeName: ExerciseAttribute] =
        [
            .sets: SetsAttribute(sets: 4),
            .reps: RepsAttribute(reps: 6),
            .weight: WeightAttribute(weight: 125, unit: WeightUnit(weightSymbol: .lb))
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
        
        let attributes: [Exercise.AttributeName: ExerciseAttribute] = [
            .time: TimeAttribute(time: 60 * 45),
            .intensity: IntensityAttribute(value: .high)
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
        
        let attributes: [Exercise.AttributeName: ExerciseAttribute] = [
            .userDefined: UserDefinedAttribute(name: "Something", value: "Value", unit: nil),
            .distance: DistanceAttribute(distance: 100, unit: DistanceUnit(distanceSymbol: .yd)),
            .time: TimeAttribute(time: 60 * 1.5),
            .sets: SetsAttribute(sets: 3),
            .reps: RepsAttribute(reps: 1),
            .weight: WeightAttribute(weight: 25, unit: WeightUnit(weightSymbol: .kg)),
            .intensity: IntensityAttribute(value: .high),
            .level: LevelAttribute(value: .ten)
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
        
        //Logging object details
        dump(exercise)
    }
    
    //MARK: Equality Tests - No Property Changes

    //Test two references to the same Exercise ID are equal
    func testExercisesEqual() {
        let id = UUID()
        let name = "My Running Exercise"
        let type = ExerciseType.running
        
        let attributes: [Exercise.AttributeName: ExerciseAttribute] = [
            .distance: DistanceAttribute(distance: 3.1, unit: DistanceUnit(distanceSymbol: .mi)),
            .time: TimeAttribute(time: 60 * 20)
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
        
        let attributes: [Exercise.AttributeName: ExerciseAttribute] = [
            .distance: DistanceAttribute(distance: 3.1, unit: DistanceUnit(distanceSymbol: .mi)),
            .time: TimeAttribute(time: 60 * 20)
        ]
        
        let date = Date()
        
        let exercise = Exercise(id: id, name: name, type: type, attributes: attributes, date: date)
        
        let temp_id = UUID()
        let temp_name = "My Running Exercise"
        let temp_type = ExerciseType.running
        
        let temp_attributes: [Exercise.AttributeName: ExerciseAttribute] = [
            .distance: DistanceAttribute(distance: 3.1, unit: DistanceUnit(distanceSymbol: .mi)),
            .time: TimeAttribute(time: 60 * 20)
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
        
        let attributes: [Exercise.AttributeName: ExerciseAttribute] = [
            .distance: DistanceAttribute(distance: 3.1, unit: DistanceUnit(distanceSymbol: .mi)),
            .time: TimeAttribute(time: 60 * 20)
        ]
        
        let date = Date()
        
        let exercise = Exercise(id: id, name: name, type: type, attributes: attributes, date: date)
        
        let copyExercise: Exercise? = nil
        
        XCTAssertNotEqual(copyExercise, exercise)
    }
    
    //MARK: Attribute Appending + Removing Tests
    
    //Test adding an Attribute increases attributes[] length
    func testExercisesAttributesAppend() {
        let id = UUID()
        let name = "My Running Exercise"
        let type = ExerciseType.running
        
        var attributes: [Exercise.AttributeName: ExerciseAttribute] = [
            .distance: DistanceAttribute(distance: 3.1, unit: DistanceUnit(distanceSymbol: .mi)),
            .time: TimeAttribute(time: 60 * 20)
        ]
        
        let attributesLength = attributes.count
        
        attributes[.weight] = WeightAttribute(weight: 120, unit: WeightUnit(weightSymbol: .kg))
        
        let date = Date()
        
        let exercise = Exercise(id: id, name: name, type: type, attributes: attributes, date: date)
                
        XCTAssertEqual(exercise.attributes.count, attributesLength+1)
    }
    
    //Test removing an Attribute decreases attributes[] length
    func testExercisesAttributesRemoval() {
        let id = UUID()
        let name = "My Running Exercise"
        let type = ExerciseType.running
        
        var attributes: [Exercise.AttributeName: ExerciseAttribute] = [
            .distance: DistanceAttribute(distance: 3.1, unit: DistanceUnit(distanceSymbol: .mi)),
            .time: TimeAttribute(time: 60 * 20)
        ]
        
        let attributesLength = attributes.count
        
        attributes.removeValue(forKey: .distance)
                
        let date = Date()
        
        let exercise = Exercise(id: id, name: name, type: type, attributes: attributes, date: date)
                
        XCTAssertEqual(exercise.attributes.count, attributesLength-1)
    }
    

    
}
