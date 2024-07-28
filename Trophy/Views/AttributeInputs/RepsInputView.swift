//
//  RepsInputView.swift
//  Trophy
//
//  Created by Oscar Lopez on 3/11/24.
//

import SwiftUI

struct RepsInputView: View {
    @ObservedObject var viewModel: RepsInputViewModel

    var body: some View {
        HStack {
            Text("Reps:")
                .frame(width: 100, alignment: .leading)

            TextField("Enter Reps", text: $viewModel.selectedReps)
                .textFieldStyle(PlainTextFieldStyle())
                .keyboardType(.numberPad)
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
    RepsInputView(viewModel: RepsInputViewModel())
}
