//
//  DistanceInputView.swift
//  Trophy
//
//  Created by Oscar Lopez on 3/11/24.
//

import SwiftUI

struct DistanceInputView: View {
    
    //State variables for tracking:
    @ObservedObject var viewModel: DistanceInputViewModel
    
    var selectedDistanceUnit: DistanceUnit.Symbol {
        return DistanceUnit.Symbol.allCases[viewModel.selectedDistanceUnitIndex]
    }
    
    let unitArray = DistanceUnit.Symbol.allCases.map { $0.rawValue }
    
    var body: some View {
        
        HStack {
            TextField("Enter Distance", text: $viewModel.selectedDistance)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
                .padding()
            
            Picker("Title", selection: $viewModel.selectedDistanceUnitIndex) {
                ForEach(0..<unitArray.count, id: \.self) { index in
                    Text(unitArray[index]).tag(index)
                }
            }
            .pickerStyle(WheelPickerStyle())
        }
        
        Text("You Entered: \(viewModel.selectedDistance) \(viewModel.selectedDistanceUnit.rawValue)")
    }
}

#Preview {
    DistanceInputView(viewModel: DistanceInputViewModel())
}
