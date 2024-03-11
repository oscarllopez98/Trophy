//
//  IntensityInputView.swift
//  Trophy
//
//  Created by Oscar Lopez on 3/11/24.
//

import SwiftUI

struct IntensityInputView: View {
    //State variables for tracking:
    @State private var selectedIntensity: String = ""    //Intensity Value
    @State private var selectedIntensityUnitIndex: Int = 0   //Intensity Value (by index)
    
    var selectedIntensityUnit: IntensityAttribute.Intensity {
        return IntensityAttribute.Intensity.allCases[selectedIntensityUnitIndex]
    }
    
    let unitArray = IntensityAttribute.Intensity.allCases.map { $0.rawValue }
    
    var body: some View {
        
        HStack {
            Picker("Intensity", selection: $selectedIntensityUnitIndex) {
                ForEach(0..<unitArray.count, id: \.self) { index in
                    Text(unitArray[index]).tag(index)
                }
            }
            .pickerStyle(WheelPickerStyle())
        }
        .border(Color.black)
        
        Text("You Entered: \(selectedIntensity) \(selectedIntensityUnit.rawValue)")
    }
}

#Preview {
    IntensityInputView()
}
