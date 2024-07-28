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
            Text("Weight:")
                .frame(width: 100, alignment: .leading)

            TextField("Enter Weight", text: $viewModel.selectedWeight)
                .keyboardType(.decimalPad)
                .padding(.vertical)
                .overlay(
                    Rectangle()
                        .frame(height: 2)
                        .padding(.top, 35),
                    alignment: .bottom
                )

            Picker("Title", selection: $viewModel.selectedWeightUnitIndex) {
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
    WeightInputView(viewModel: WeightInputViewModel())
}
