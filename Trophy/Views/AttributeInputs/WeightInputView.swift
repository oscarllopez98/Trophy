//
//  WeightInputView.swift
//  Trophy
//
//  Created by Oscar Lopez on 3/11/24.
//

import SwiftUI

struct WeightInputView: View {
    
    @ObservedObject var viewModel: WeightInputViewModel
    
    var selectedWeightUnit: WeightUnit.Symbol {
        return WeightUnit.Symbol.allCases[viewModel.selectedWeightUnitIndex]
    }
    
    let unitArray = WeightUnit.Symbol.allCases.map { $0.rawValue }
    
    var body: some View {
        
        HStack {
            TextField("Enter Weight", text: $viewModel.selectedWeight)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
                .padding()
            
            Picker("Title", selection: $viewModel.selectedWeightUnitIndex) {
                ForEach(0..<unitArray.count, id: \.self) { index in
                    Text(unitArray[index]).tag(index)
                }
            }
            .pickerStyle(WheelPickerStyle())
        }
        
        Text("You Entered: \(viewModel.selectedWeight) \(selectedWeightUnit.rawValue)")
    }
    
}

#Preview {
    WeightInputView(viewModel: WeightInputViewModel())
}
