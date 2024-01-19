//
//  TrophyUnitsTests.swift
//  TrophyTests
//
//  Created by Oscar Lopez on 12/23/23.
//

import XCTest
@testable import Trophy

final class TrophyUnitsTests: XCTestCase {
    
    //MARK: Initialization Tests
    
    //Test ExerciseUnit initialization
    func testExerciseUnitInitialization() {
        let exerciseUnitReps = ExerciseUnit(exerciseSymbol: .reps)
        let exerciseUnitLaps = ExerciseUnit(exerciseSymbol: .laps)
        
        XCTAssertEqual(exerciseUnitReps.symbol, ExerciseUnit(exerciseSymbol: .reps).symbol)
        XCTAssertEqual(exerciseUnitLaps.symbol, ExerciseUnit(exerciseSymbol: .laps).symbol)
    }
    
    //Test WeightUnit initiailization
    func testWeightUnitInitialization() {
        let weightUnitPounds = WeightUnit(weightSymbol: .lb)
        let weightUnitKilograms = WeightUnit(weightSymbol: .kg)
        
        XCTAssertEqual(weightUnitPounds.symbol, WeightUnit(weightSymbol: .lb).symbol)
        XCTAssertEqual(weightUnitKilograms.symbol, WeightUnit(weightSymbol: .kg).symbol)
    }
    
    //Test DistanceUnit initialization
    func testDistanceUnitInitialization() {
        let distanceUnitMeters = DistanceUnit(distanceSymbol: .m)
        let distanceUnitKilometers = DistanceUnit(distanceSymbol: .km)
        
        let distanceUnitMiles = DistanceUnit(distanceSymbol: .mi)
        let distanceUnitYards = DistanceUnit(distanceSymbol: .yd)
        let distanceUnitFeet = DistanceUnit(distanceSymbol: .ft)
        
        XCTAssertEqual(distanceUnitMeters.symbol, DistanceUnit(distanceSymbol: .m).symbol)
        XCTAssertEqual(distanceUnitKilometers.symbol, DistanceUnit(distanceSymbol: .km).symbol)
        
        XCTAssertEqual(distanceUnitMiles.symbol, DistanceUnit(distanceSymbol: .mi).symbol)
        XCTAssertEqual(distanceUnitYards.symbol, DistanceUnit(distanceSymbol: .yd).symbol)
        XCTAssertEqual(distanceUnitFeet.symbol, DistanceUnit(distanceSymbol: .ft).symbol)
    }
    
    //Test all Units are children of the parent Unit class
    func testUnitsConformToProtocol() {
        let exerciseUnitReps = ExerciseUnit(exerciseSymbol: .reps)
        let exerciseUnitLaps = ExerciseUnit(exerciseSymbol: .laps)
        
        let weightUnitPounds = WeightUnit(weightSymbol: .lb)
        let weightUnitKilograms = WeightUnit(weightSymbol: .kg)
        
        let distanceUnitMeters = DistanceUnit(distanceSymbol: .m)
        let distanceUnitKilometers = DistanceUnit(distanceSymbol: .km)
        
        let distanceUnitMiles = DistanceUnit(distanceSymbol: .mi)
        let distanceUnitYards = DistanceUnit(distanceSymbol: .yd)
        let distanceUnitFeet = DistanceUnit(distanceSymbol: .ft)
        
        XCTAssertTrue(exerciseUnitReps is Trophy.Unit)
        XCTAssertTrue(exerciseUnitLaps is Trophy.Unit)
        
        XCTAssertTrue(weightUnitPounds is Trophy.Unit)
        XCTAssertTrue(weightUnitKilograms is Trophy.Unit)
        
        XCTAssertTrue(distanceUnitMeters is Trophy.Unit)
        XCTAssertTrue(distanceUnitKilometers is Trophy.Unit)
        XCTAssertTrue(distanceUnitMiles is Trophy.Unit)
        XCTAssertTrue(distanceUnitYards is Trophy.Unit)
        XCTAssertTrue(distanceUnitFeet is Trophy.Unit)
    }
}
