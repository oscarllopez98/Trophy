//
//  TimeInputView.swift
//  Trophy
//
//  Created by Oscar Lopez on 3/11/24.
//

import SwiftUI

struct TimeInputView: View {

    @ObservedObject var viewModel: TimeInputViewModel
    
    let hoursNumbers = Array((0...23).reversed())
    let minutesNumbers = Array((0...59).reversed())
    let secondsNumbers = Array((0...59).reversed())

    
    var body: some View {
        HStack {
            
            //Hours VStack
            VStack {
                Text("Hours")
                //Picker for Hours
                Picker("Hours", selection: $viewModel.selectedHours) {
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
                Picker("Minutes", selection: $viewModel.selectedMinutes) {
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
                Picker("Seconds", selection: $viewModel.selectedSeconds) {
                    ForEach(secondsNumbers, id: \.self) {
                        Text("\($0)")
                    }
                }
                .pickerStyle(WheelPickerStyle())
            }
        }
        
//        Text("You Entered: HH(\(viewModel.selectedHours)) MM(\(viewModel.selectedMinutes)) SS(\(viewModel.selectedSeconds))")
    }
}

#Preview {
    TimeInputView(viewModel: TimeInputViewModel())
}
