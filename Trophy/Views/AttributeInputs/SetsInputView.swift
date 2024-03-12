//
//  SetsInputView.swift
//  Trophy
//
//  Created by Oscar Lopez on 3/11/24.
//

import SwiftUI

struct SetsInputView: View {
    //State variables for tracking:
    @State private var selectedSets: String = ""    //Sets value
        
    var body: some View {
        
        HStack {
            TextField("Enter Sets", text: $selectedSets)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.numberPad)
                .padding()
        }
        
        Text("You Entered: \(selectedSets)")
    }
}

#Preview {
    SetsInputView()
}
