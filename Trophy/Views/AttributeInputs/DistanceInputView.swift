//
//  DistanceInputView.swift
//  Trophy
//
//  Created by Oscar Lopez on 3/11/24.
//

import SwiftUI

struct DistanceInputView: View {
    @ObservedObject var viewModel: DistanceInputViewModel

    var selectedDistanceUnit: DistanceUnit.Symbol {
        return DistanceUnit.Symbol.allCases[viewModel.selectedDistanceUnitIndex]
    }

    let unitArray = DistanceUnit.Symbol.allCases.map { $0.rawValue }

    var body: some View {
        HStack {
            Text("Distance:")
                .frame(width: 100, alignment: .leading)

            TextField("Enter Distance", text: $viewModel.selectedDistance)
                .keyboardType(.decimalPad)
                .padding(.vertical)
                .overlay(
                    Rectangle()
                        .frame(height: 2)
                        .padding(.top, 35),
                    alignment: .bottom
                )

            Picker("Title", selection: $viewModel.selectedDistanceUnitIndex) {
                ForEach(0..<unitArray.count, id: \.self) { index in
                    Text(unitArray[index]).tag(index)
                }
            }
            .pickerStyle(MenuPickerStyle())
        }
        .frame(maxWidth: .infinity)
        .padding(.bottom, 10)
    }
}

#Preview {
    DistanceInputView(viewModel: DistanceInputViewModel())
}
