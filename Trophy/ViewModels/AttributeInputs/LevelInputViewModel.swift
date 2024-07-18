//
//  LevelInputViewModel.swift
//  Trophy
//
//  Created by Oscar Lopez on 3/12/24.
//

import Foundation

class LevelInputViewModel: ObservableObject {
    @Published var selectedLevelUnitIndex: Int = 0
    
    var selectedLevel: LevelAttribute.Level {
        return LevelAttribute.Level(rawValue: selectedLevelUnitIndex) ?? .NA
    }
}
