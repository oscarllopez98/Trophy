//
//  SetsInputView.swift
//  Trophy
//
//  Created by Oscar Lopez on 3/11/24.
//

import SwiftUI

struct SetsInputView: View {
    @ObservedObject var viewModel: SetsInputViewModel

    var body: some View {
        HStack {
            Text("Sets:")
                .frame(width: 100, alignment: .leading)

            TextField("Enter Sets", text: $viewModel.selectedSets)
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
    SetsInputView(viewModel: SetsInputViewModel())
}
