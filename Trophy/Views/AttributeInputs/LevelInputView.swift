//
//  LevelInputView.swift
//  Trophy
//
//  Created by Oscar Lopez on 3/11/24.
//

import SwiftUI

struct LevelInputView: View {
    @ObservedObject var viewModel: LevelInputViewModel

    var body: some View {
        HStack {
            Text("Level:")
                .frame(width: 100, alignment: .leading)

            Picker("Level", selection: $viewModel.selectedLevelUnitIndex) {
                ForEach(LevelAttribute.Level.allCases.indices, id: \.self) { index in
                    Text(LevelAttribute.Level(rawValue: index)?.description ?? "N/A").tag(index)
                }
            }
            .pickerStyle(MenuPickerStyle())
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
    LevelInputView(viewModel: LevelInputViewModel())
}
