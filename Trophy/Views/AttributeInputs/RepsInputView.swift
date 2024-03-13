//
//  RepsInputView.swift
//  Trophy
//
//  Created by Oscar Lopez on 3/11/24.
//

import SwiftUI

struct RepsInputView: View {
    //State variables for tracking:
    @ObservedObject var viewModel: RepsInputViewModel
        
    var body: some View {
        
        HStack {
            TextField("Enter Reps", text: $viewModel.selectedReps)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
                .padding()
        }
        
        Text("You Entered: \(viewModel.selectedReps)")
    }
}

#Preview {
    RepsInputView(viewModel: RepsInputViewModel())
}
