//
//  TrophyAttributeTests.swift
//  TrophyTests
//
//  Created by Oscar Lopez on 12/23/23.
//

import XCTest
@testable import Trophy

final class TrophyAttributeTests: XCTestCase {

    //MARK: Setup + Teardown
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    //MARK: Initialization Tests
    
    //Test ExerciseAttribute initialization
    func testExerciseAttributeInitialization() throws {
        //Creating an Exercise Attribute
        let exerciseAttribute =
        ExerciseAttribute(name: "Test",
                          value: .double(123),
                          unit: DistanceUnit(distanceSymbol: .km))
        
        XCTAssertEqual(exerciseAttribute.name, "Test")
        XCTAssertEqual(exerciseAttribute.value, .double(123))
        if let unit = exerciseAttribute.unit, case let .custom(symbol) = unit.symbol {
            XCTAssertEqual(symbol, DistanceUnit.Symbol.km.rawValue)
        } else {
            XCTFail("exerciseAttribute.unit is nil or has an unexpected type")
        }
        
    }
    
    //Test UserDefinedAttribute initializiation
    func testUserDefinedAttribute() throws {
        let userDefineAttribute =
        UserDefinedAttribute(name: "Test",
                             value: "Value",
                             unit: DistanceUnit(distanceSymbol: .m))
        
        XCTAssertEqual(userDefineAttribute.name, "Test")
        XCTAssertEqual(userDefineAttribute.value, .string("Value"))
        if let unit = userDefineAttribute.unit, case let .custom(symbol) = unit.symbol {
            XCTAssertEqual(symbol, DistanceUnit.Symbol.m.rawValue)
        } else {
            XCTFail("userDefineAttribute.unit is nil or has an unexpected type")
        }
    }
    
    //Test DistanceAttribute initialization
    func testDistanceAttribute() throws {
        let distanceAttribute = DistanceAttribute(distance: 12,
                                                  unit: DistanceUnit(distanceSymbol: .mi))
        
        XCTAssertEqual(distanceAttribute.name, "Distance")
        XCTAssertEqual(distanceAttribute.value, .double(12))
        if let unit = distanceAttribute.unit, case let .custom(symbol) = unit.symbol {
            XCTAssertEqual(symbol, DistanceUnit.Symbol.mi.rawValue)
        } else {
            XCTFail("distanceAttribute.unit is nil or has an unexpected type")
        }
    }
    
    //Test TimeAttribute initialization
    func testTimeAttribute() throws {
        let timeAttribute = TimeAttribute(time: 60.5)
        
        XCTAssertEqual(timeAttribute.name, "Time")
        XCTAssertEqual(timeAttribute.value, .timeInterval(60.5))
        XCTAssertNil(timeAttribute.unit)
    }
    
    //Test SetsAttribute initialization
    func testSetsAttribute() throws {
        let setsAttribute = SetsAttribute(sets: 8)
        
        XCTAssertEqual(setsAttribute.name, "Sets")
        XCTAssertEqual(setsAttribute.value, .integer(8))
        XCTAssertNil(setsAttribute.unit)
    }
    
    //Test RepsAttribute initialization
    func testRepsAttribute() throws {
        let repsAttribute = RepsAttribute(reps: 10)
        
        XCTAssertEqual(repsAttribute.name, "Reps")
        XCTAssertEqual(repsAttribute.value, .integer(10))
        XCTAssertNil(repsAttribute.unit)
    }
    
    //Test WeightAttribute initialization
    func testWeightAttribute() throws {
        let weightAttribute = WeightAttribute(weight: 175,
                                              unit: WeightUnit(weightSymbol: .lb))
        
        XCTAssertEqual(weightAttribute.name, "Weight")
        XCTAssertEqual(weightAttribute.value, .double(175))
        if let unit = weightAttribute.unit, case let .custom(symbol) = unit.symbol {
            XCTAssertEqual(symbol, WeightUnit.Symbol.lb.rawValue)
        } else {
            XCTFail("weightAttribute.unit is nil or has an unexpected type")
        }
    }
    
    //Test IntensityAttribute initialization
    func testIntensityAttribute() throws {
        let intensityAttributeLow = IntensityAttribute(value: .low)
        let intensityAttributeMed = IntensityAttribute(value: .med)
        let intensityAttributeHigh = IntensityAttribute(value: .high)
        
        XCTAssertEqual(intensityAttributeLow.name, "Intensity")
        XCTAssertEqual(intensityAttributeMed.name, "Intensity")
        XCTAssertEqual(intensityAttributeHigh.name, "Intensity")
        
        XCTAssertEqual(intensityAttributeLow.value, .string("low"))
        XCTAssertEqual(intensityAttributeMed.value, .string("med"))
        XCTAssertEqual(intensityAttributeHigh.value, .string("high"))
        
        XCTAssertNil(intensityAttributeLow.unit)
        XCTAssertNil(intensityAttributeMed.unit)
        XCTAssertNil(intensityAttributeHigh.unit)
    }
    
    //Test LevelAttribute initialization
    func testLevelAttribute() throws {
        let levelAttributeOne = LevelAttribute(value: .one)
        let levelAttributeTen = LevelAttribute(value: .ten)
        
        XCTAssertEqual(levelAttributeOne.name, "Level")
        XCTAssertEqual(levelAttributeTen.name, "Level")
        
        XCTAssertEqual(levelAttributeOne.value, .integer(1))
        XCTAssertEqual(levelAttributeTen.value, .integer(10))
        
        XCTAssertNil(levelAttributeOne.unit)
        XCTAssertNil(levelAttributeTen.unit)
    }
    
    //MARK: Equality Tests - No Property Changes
    
    //Test ExerciseAttributes with same property values are equal
    func testExerciseAttributeEqual() throws {
        let exerciseAttribute1 = ExerciseAttribute(name: "My Attribute",
                                                   value: .integer(0),
                                                   unit: Unit(symbol: .custom("My Custom Unit")))
        let exerciseAttribute2 = ExerciseAttribute(name: "My Attribute",
                                                   value: .integer(0),
                                                   unit: Unit(symbol: .custom("My Custom Unit")))
        
        XCTAssertEqual(exerciseAttribute1, exerciseAttribute2)
    }
    
    //Test ExerciseAttributes with different names are not equal
    func testExerciseAttributeNotEqualName() throws {
        let exerciseAttribute1 = ExerciseAttribute(name: "My First Attribute",
                                                   value: .integer(0),
                                                   unit: Unit(symbol: .custom("My Custom Unit")))
        let exerciseAttribute2 = ExerciseAttribute(name: "My Second Attribute",
                                                   value: .integer(0),
                                                   unit: Unit(symbol: .custom("My Custom Unit")))
        
        XCTAssertNotEqual(exerciseAttribute1, exerciseAttribute2)
    }
    
    //Test ExerciseAttributes with different value data types are not equal
    func testExerciseAttributeNotEqualValueDataType() throws {
        let exerciseAttribute1 = ExerciseAttribute(name: "My Attribute",
                                                   value: .string("0"),
                                                   unit: Unit(symbol: .custom("My Custom Unit")))
        let exerciseAttribute2 = ExerciseAttribute(name: "My Attribute",
                                                   value: .integer(0),
                                                   unit: Unit(symbol: .custom("My Custom Unit")))
        
        XCTAssertNotEqual(exerciseAttribute1, exerciseAttribute2)
    }
    
    //Test ExerciseAttributes with different values are not equal
    func testExerciseAttributeNotEqualValue() throws {
        let exerciseAttribute1 = ExerciseAttribute(name: "My Attribute",
                                                   value: .integer(1),
                                                   unit: Unit(symbol: .custom("My Custom Unit")))
        let exerciseAttribute2 = ExerciseAttribute(name: "My Attribute",
                                                   value: .integer(0),
                                                   unit: Unit(symbol: .custom("My Custom Unit")))
        
        XCTAssertNotEqual(exerciseAttribute1, exerciseAttribute2)
    }
    
    //Test ExerciseAttributes with different units are not equal
    func testExerciseAttributeNotEqualUnit() throws {
        let exerciseAttribute1 = ExerciseAttribute(name: "My Attribute",
                                                   value: .integer(0),
                                                   unit: Unit(symbol: .custom("A Custom Unit")))
        let exerciseAttribute2 = ExerciseAttribute(name: "My Attribute",
                                                   value: .integer(0),
                                                   unit: Unit(symbol: .custom("Custom Unit")))
        
        XCTAssertNotEqual(exerciseAttribute1, exerciseAttribute2)
    }
    
    
    //Test ExerciseAttributes with different unit types are not equal
    func testExerciseAttributeNotEqualUnitType() throws {
        let exerciseAttribute1 = ExerciseAttribute(name: "My Attribute",
                                                   value: .integer(0),
                                                   unit: WeightUnit(weightSymbol: .kg))
        
        let exerciseAttribute2 = ExerciseAttribute(name: "My Attribute",
                                                   value: .integer(0),
                                                   unit: Unit(symbol: .custom("Custom Unit")))
        
        XCTAssertNotEqual(exerciseAttribute1, exerciseAttribute2)
    }
    
    
    //Test ExerciseAttributes with one nil unit type are not equal
    func testExerciseAttributeOneNilUnitType() throws {
        let exerciseAttribute1 = ExerciseAttribute(name: "My Attribute",
                                                   value: .integer(0))
        
        let exerciseAttribute2 = ExerciseAttribute(name: "My Attribute",
                                                   value: .integer(0),
                                                   unit: Unit(symbol: .custom("Custom Unit")))
        
        XCTAssertNotEqual(exerciseAttribute1, exerciseAttribute2)
    }
    
    //Test ExerciseAttributes with two nil unit type are equal
    func testExerciseAttributeNilUnitTypes() throws {
        let exerciseAttribute1 = ExerciseAttribute(name: "My Attribute",
                                                   value: .integer(0))
        
        let exerciseAttribute2 = ExerciseAttribute(name: "My Attribute",
                                                   value: .integer(0))

        XCTAssertEqual(exerciseAttribute1, exerciseAttribute2)
    }
    
    
    //MARK: Equality Tests - Property Changes

    
    //Test ExerciseAttributes where changing name property to be equal are equal
    func testExerciseAttributeChangeNameForEquality() throws {
        let exerciseAttribute1 = ExerciseAttribute(name: "Not My Attribute",
                                                   value: .integer(0))
        
        let exerciseAttribute2 = ExerciseAttribute(name: "My Attribute",
                                                   value: .integer(0))

        exerciseAttribute1.name = "My Attribute"

        XCTAssertEqual(exerciseAttribute1, exerciseAttribute2)
    }
    
    //Test ExerciseAttributes where changing value property to be equal are equal
    func testExerciseAttributeChangeValueForEquality() throws {
        let exerciseAttribute1 = ExerciseAttribute(name: "My Attribute",
                                                   value: .integer(1))
        
        let exerciseAttribute2 = ExerciseAttribute(name: "My Attribute",
                                                   value: .integer(0))

        exerciseAttribute1.value = .integer(0)

        XCTAssertEqual(exerciseAttribute1, exerciseAttribute2)
    }
    
    //Test ExerciseAttributes where changing unit property to be equal are equal
    func testExerciseAttributeChangeUnitTypeForEquality() throws {
        let exerciseAttribute1 = ExerciseAttribute(name: "My Attribute",
                                                   value: .integer(0),
                                                   unit: DistanceUnit(distanceSymbol: .yd))
        
        let exerciseAttribute2 = ExerciseAttribute(name: "My Attribute",
                                                   value: .integer(0),
                                                   unit: DistanceUnit(distanceSymbol: .m))

        exerciseAttribute1.unit = DistanceUnit(distanceSymbol: .m)

        XCTAssertEqual(exerciseAttribute1, exerciseAttribute2)
    }
    
    //Test ExerciseAttributes where changing a unit property to be nil are not equal
    func testExerciseAttributeChangeUnitTypeNilForEquality() throws {
        let exerciseAttribute1 = ExerciseAttribute(name: "My Attribute",
                                                   value: .integer(0),
                                                   unit: DistanceUnit(distanceSymbol: .yd))
        
        let exerciseAttribute2 = ExerciseAttribute(name: "My Attribute",
                                                   value: .integer(0))

        exerciseAttribute1.unit = nil

        XCTAssertEqual(exerciseAttribute1, exerciseAttribute2)
    }
    
    
}
