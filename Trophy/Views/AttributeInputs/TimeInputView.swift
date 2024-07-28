//
//  TimeInputView.swift
//  Trophy
//
//  Created by Oscar Lopez on 3/11/24.
//

import SwiftUI

struct TimeInputView: View {
    @ObservedObject var viewModel: TimeInputViewModel

    let hoursNumbers = Array(0...23)
    let minutesNumbers = Array(0...59)
    let secondsNumbers = Array(0...59)

    var body: some View {
        HStack {
            Text("Time:")
                .frame(width: 100, alignment: .leading)

            HStack(spacing: 0) {
                // Hours Picker
                Picker("Hours", selection: $viewModel.selectedHours) {
                    ForEach(hoursNumbers, id: \.self) {
                        Text("\($0)h")
                    }
                }
                .pickerStyle(MenuPickerStyle())

                // Minutes Picker
                Picker("Minutes", selection: $viewModel.selectedMinutes) {
                    ForEach(minutesNumbers, id: \.self) {
                        Text("\($0)m")
                    }
                }
                .pickerStyle(MenuPickerStyle())

                // Seconds Picker
                Picker("Seconds", selection: $viewModel.selectedSeconds) {
                    ForEach(secondsNumbers, id: \.self) {
                        Text("\($0)s")
                    }
                }
                .pickerStyle(MenuPickerStyle())
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical)
            .overlay(
                Rectangle()
                    .frame(height: 2)
                    .padding(.top, 35),
                alignment: .bottom
            )
        }
        .frame(maxWidth: .infinity)
        .padding(.bottom, 10)
    }
}

#Preview {
    TimeInputView(viewModel: TimeInputViewModel())
}
