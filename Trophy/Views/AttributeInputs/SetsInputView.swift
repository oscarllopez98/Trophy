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
            TextField("Enter Sets", text: $viewModel.selectedSets)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
                .padding()
        }
        
//        Text("You Entered: \(viewModel.selectedSets)")
    }
}

#Preview {
    SetsInputView(viewModel: SetsInputViewModel())
}
