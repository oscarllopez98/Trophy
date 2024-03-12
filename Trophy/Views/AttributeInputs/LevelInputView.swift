//
//  LevelInputView.swift
//  Trophy
//
//  Created by Oscar Lopez on 3/11/24.
//

import SwiftUI

struct LevelInputView: View {
    //State variables for tracking:
    @Binding var selectedLevelUnitIndex: Int   //Level Unit Value (by index)
    
    var selectedLevelUnit: LevelAttribute.Level {
        return LevelAttribute.Level.allCases[selectedLevelUnitIndex]
    }
    
    let unitArray = LevelAttribute.Level.allCases.map { $0.rawValue }
    
    var body: some View {
        
        HStack {
            Picker("Level", selection: $selectedLevelUnitIndex) {
                ForEach(0..<unitArray.count, id: \.self) { index in
                    Text(String(unitArray[index])).tag(index)
                }
            }
            .pickerStyle(WheelPickerStyle())
        }
        
        Text("You Entered: \(selectedLevelUnit.rawValue)")
    }
}

#Preview {
    LevelInputView(selectedLevelUnitIndex: .constant(0))
}
