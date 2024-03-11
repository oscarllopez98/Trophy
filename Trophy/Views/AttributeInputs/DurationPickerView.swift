//
//  DurationPickerView.swift
//  Trophy
//
//  Created by Oscar Lopez on 3/5/24.
//

import SwiftUI

struct DurationPickerView: View {
    
    @State private var selectedHours = 0
    @State private var selectedMinutes = 0
    @State private var selectedSeconds = 0
    
    let hoursNumbers = Array((0...23).reversed())
    let minutesNumbers = Array((0...59).reversed())
    let secondsNumbers = Array((0...59).reversed())
    
    var body: some View {
        HStack {
            
            //Hours VStack
            VStack {
                Text("Hours")
                //Picker for Hours
                Picker("Hours", selection: $selectedHours) {
                    ForEach(hoursNumbers, id: \.self) {
                        Text("\($0)")
                    }
                }
                .pickerStyle(WheelPickerStyle())
            }
            
            //Minutes VStack
            VStack {
                Text("Minutes")
                //Picker for Minutes
                Picker("Minutes", selection: $selectedMinutes) {
                    ForEach(minutesNumbers, id: \.self) {
                        Text("\($0)")
                    }
                }
                .pickerStyle(WheelPickerStyle())
            }
            
            //Seconds VStack
            VStack {
                Text("Seconds")
                //Picker for Seconds
                Picker("Seconds", selection: $selectedSeconds) {
                    ForEach(secondsNumbers, id: \.self) {
                        Text("\($0)")
                    }
                }
                .pickerStyle(WheelPickerStyle())
            }
        }
    }
}

#Preview {
    DurationPickerView()
}
