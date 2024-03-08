//
//  NewExerciseModalView.swift
//  Trophy
//
//  Created by Oscar Lopez on 3/4/24.
//

import SwiftUI

struct NewExerciseModalView: View {
    
    @ObservedObject var viewModel: ExerciseViewModel
    @State private var isExpanded = false

    //Duration (hours, minutes, seconds)
    
    var body: some View {
        
        Button(action : {
            withAnimation {
                self.isExpanded.toggle()
            }
        }) {
            VStack {

                //Expand DurationPickerView
                if isExpanded {
                    Text("- Duration")
                        .font(.title)
                        .foregroundStyle(.blue)
                        .padding()
                    DurationPickerView()
                } else {
                    Text("+ Duration")
                        .font(.title)
                        .foregroundStyle(.blue)
                        .padding()
                }
            }
        }
        
 
        
        
        
    }
}

#Preview {
    NewExerciseModalView(viewModel: ExerciseViewModel.sample())
}
