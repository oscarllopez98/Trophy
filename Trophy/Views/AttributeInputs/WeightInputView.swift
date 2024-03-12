//
//  WeightInputView.swift
//  Trophy
//
//  Created by Oscar Lopez on 3/11/24.
//

import SwiftUI

struct WeightInputView: View {
    
    //State variables for tracking:
    @State private var selectedWeight: String = ""    //Weight Value
    @State private var selectedWeightUnitIndex: Int = 0   //Weight Unit Value (by index)
    
    var selectedWeightUnit: WeightUnit.Symbol {
        return WeightUnit.Symbol.allCases[selectedWeightUnitIndex]
    }
    
    let unitArray = WeightUnit.Symbol.allCases.map { $0.rawValue }
    
    var body: some View {
        
        HStack {
            TextField("Enter Weight", text: $selectedWeight)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
                .padding()
            
            Picker("Title", selection: $selectedWeightUnitIndex) {
                ForEach(0..<unitArray.count, id: \.self) { index in
                    Text(unitArray[index]).tag(index)
                }
            }
            .pickerStyle(WheelPickerStyle())
        }
        
        Text("You Entered: \(selectedWeight) \(selectedWeightUnit.rawValue)")
    }
    
}

#Preview {
    WeightInputView()
}
