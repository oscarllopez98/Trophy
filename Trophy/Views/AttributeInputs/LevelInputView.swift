//
//  LevelInputView.swift
//  Trophy
//
//  Created by Oscar Lopez on 3/11/24.
//

import SwiftUI

struct LevelInputView: View {
    @ObservedObject var viewModel: LevelInputViewModel
    
    var body: some View {
        Picker("Level", selection: $viewModel.selectedLevelUnitIndex) {
            ForEach(LevelAttribute.Level.allCases.indices, id: \.self) { index in
                Text(LevelAttribute.Level(rawValue: index)?.description ?? "N/A").tag(index)
            }
        }
        .pickerStyle(WheelPickerStyle())
    }
}



#Preview {
    LevelInputView(viewModel: LevelInputViewModel())
}
