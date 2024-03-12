//
//  DistanceInputView.swift
//  Trophy
//
//  Created by Oscar Lopez on 3/11/24.
//

import SwiftUI

struct DistanceInputView: View {
    
    //State variables for tracking:
    @Binding var selectedDistance: String   //Distance Value
    @Binding var selectedDistanceUnitIndex: Int  //Distance Unit Value (by index)
    
    var selectedDistanceUnit: DistanceUnit.Symbol {
        return DistanceUnit.Symbol.allCases[selectedDistanceUnitIndex]
    }
    
    let unitArray = DistanceUnit.Symbol.allCases.map { $0.rawValue }
    
    var body: some View {
        
        HStack {
            TextField("Enter Distance", text: $selectedDistance)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
                .padding()
            
            Picker("Title", selection: $selectedDistanceUnitIndex) {
                ForEach(0..<unitArray.count, id: \.self) { index in
                    Text(unitArray[index]).tag(index)
                }
            }
            .pickerStyle(WheelPickerStyle())
        }
        .border(Color.black)
        
        Text("You Entered: \(selectedDistance) \(selectedDistanceUnit.rawValue)")
    }
}

#Preview {
    DistanceInputView(selectedDistance: .constant(""),
                      selectedDistanceUnitIndex: .constant(0))
}
