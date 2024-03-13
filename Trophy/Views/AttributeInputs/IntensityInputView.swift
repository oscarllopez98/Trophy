//
//  IntensityInputView.swift
//  Trophy
//
//  Created by Oscar Lopez on 3/11/24.
//

import SwiftUI

struct IntensityInputView: View {

    @ObservedObject var viewModel: IntensityInputViewModel
    
    var selectedIntensityUnit: IntensityAttribute.Intensity {
        return IntensityAttribute.Intensity.allCases[viewModel.selectedIntensityUnitIndex]
    }
    
    let unitArray = IntensityAttribute.Intensity.allCases.map { $0.rawValue }
    
    var body: some View {
        
        HStack {
            Picker("Intensity", selection: $viewModel.selectedIntensityUnitIndex) {
                ForEach(0..<unitArray.count, id: \.self) { index in
                    Text(unitArray[index]).tag(index)
                }
            }
            .pickerStyle(WheelPickerStyle())
        }
        
//        Text("You Entered: \(viewModel.selectedIntensity) \(selectedIntensityUnit.rawValue)")
    }
}

#Preview {
    IntensityInputView(viewModel: IntensityInputViewModel())
}
