//
//  ExerciseModalView.swift
//  Trophy
//
//  Created by Oscar Lopez on 3/3/24.
//

import SwiftUI

struct ExerciseModalView: View {
    
    let modalTitle: String
    
    var body: some View {
        VStack {
            Text(modalTitle)
                .font(.title)
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
    }
}

#Preview {
    ExerciseModalView(modalTitle: "Modal Title")
}
