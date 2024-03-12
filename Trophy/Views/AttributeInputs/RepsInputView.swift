//
//  RepsInputView.swift
//  Trophy
//
//  Created by Oscar Lopez on 3/11/24.
//

import SwiftUI

struct RepsInputView: View {
    //State variables for tracking:
    @State private var selectedReps: String = ""    //Reps value
        
    var body: some View {
        
        HStack {
            TextField("Enter Reps", text: $selectedReps)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
                .padding()
        }
        
        Text("You Entered: \(selectedReps)")
    }
}

#Preview {
    RepsInputView()
}
