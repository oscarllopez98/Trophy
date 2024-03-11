//
//  NewExerciseModalView.swift
//  Trophy
//
//  Created by Oscar Lopez on 3/4/24.
//

import SwiftUI

struct NewExerciseModalView: View {
    
    @ObservedObject var viewModel: ExerciseViewModel
    @State private var isExpandedDuration = false

    //Duration (hours, minutes, seconds)
    
    var body: some View {
        
        
        //Distance Attribute
        
        
        //Time Attribute
        
        
        //Sets Attribute
        
        
        //Reps Attribute
        
        
        //Weight Attribute
        
        
        //Intensity Attribute
        
        
        //Level Attribute
        
        
        //Duration Attribute
        Button(action : {
            withAnimation {
                self.isExpandedDuration.toggle()
            }
        }) {
            VStack {

                //Expand DurationPickerView
                if isExpandedDuration {
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
