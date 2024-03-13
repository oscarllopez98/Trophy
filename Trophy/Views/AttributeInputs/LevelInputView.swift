//
//  LevelInputView.swift
//  Trophy
//
//  Created by Oscar Lopez on 3/11/24.
//

import SwiftUI

struct LevelInputView: View {

    @ObservedObject var viewModel: LevelInputViewModel
    
    var selectedLevelUnit: LevelAttribute.Level {
        return LevelAttribute.Level.allCases[viewModel.selectedLevelUnitIndex]
    }
    
    let unitArray = LevelAttribute.Level.allCases.map { $0.rawValue }
    
    var body: some View {
        
        HStack {
            Picker("Level", selection: $viewModel.selectedLevelUnitIndex) {
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
    LevelInputView(viewModel: LevelInputViewModel())
}
