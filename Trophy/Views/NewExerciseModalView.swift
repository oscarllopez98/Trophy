//
//  NewExerciseModalView.swift
//  Trophy
//
//  Created by Oscar Lopez on 3/4/24.
//

import SwiftUI

struct NewExerciseModalView: View {
    
    @ObservedObject var viewModel: ExerciseViewModel
    
    //State values for Custom Pickers
    @State private var isExpandedDistance = false
    @State private var isExpandedTime = false
    @State private var isExpandedSets = false
    @State private var isExpandedReps = false
    @State private var isExpandedWeight = false
    @State private var isExpandedIntensity = false
    @State private var isExpandedLevel = false

    

    //Duration (hours, minutes, seconds)
    
    var body: some View {
        
        ScrollView {
            //Distance Attribute
            Button(action : {
                withAnimation {
                    self.isExpandedDistance.toggle()
                }
            }) {
                VStack {

                    //Expand DistancePickerView
                    if isExpandedDistance {
                        Text("- Distance")
                            .font(.title)
                            .foregroundStyle(.blue)
                            .padding()
                        DistanceInputView()
                    } else {
                        Text("+ Distance")
                            .font(.title)
                            .foregroundStyle(.blue)
                            .padding()
                    }
                }
            }
            
            //Time Attribute
            Button(action : {
                withAnimation {
                    self.isExpandedTime.toggle()
                }
            }) {
                VStack {

                    //Expand SetsPickerView
                    if isExpandedTime {
                        Text("- Time")
                            .font(.title)
                            .foregroundStyle(.blue)
                            .padding()
                        TimeInputView()
                    } else {
                        Text("+ Time")
                            .font(.title)
                            .foregroundStyle(.blue)
                            .padding()
                    }
                }
            }
            
            //Sets Attribute
            Button(action : {
                withAnimation {
                    self.isExpandedSets.toggle()
                }
            }) {
                VStack {

                    //Expand SetsPickerView
                    if isExpandedSets {
                        Text("- Sets")
                            .font(.title)
                            .foregroundStyle(.blue)
                            .padding()
                        SetsInputView()
                    } else {
                        Text("+ Sets")
                            .font(.title)
                            .foregroundStyle(.blue)
                            .padding()
                    }
                }
            }
            
            //Reps Attribute
            Button(action : {
                withAnimation {
                    self.isExpandedReps.toggle()
                }
            }) {
                VStack {

                    //Expand RepsPickerView
                    if isExpandedReps {
                        Text("- Reps")
                            .font(.title)
                            .foregroundStyle(.blue)
                            .padding()
                        RepsInputView()
                    } else {
                        Text("+ Reps")
                            .font(.title)
                            .foregroundStyle(.blue)
                            .padding()
                    }
                }
            }
            
            
            //Weight Attribute
            Button(action : {
                withAnimation {
                    self.isExpandedWeight.toggle()
                }
            }) {
                VStack {

                    //Expand RepsPickerView
                    if isExpandedWeight {
                        Text("- Weight")
                            .font(.title)
                            .foregroundStyle(.blue)
                            .padding()
                        WeightInputView()
                    } else {
                        Text("+ Weight")
                            .font(.title)
                            .foregroundStyle(.blue)
                            .padding()
                    }
                }
            }
            
            
            //Intensity Attribute
            Button(action : {
                withAnimation {
                    self.isExpandedIntensity.toggle()
                }
            }) {
                VStack {

                    //Expand RepsPickerView
                    if isExpandedIntensity {
                        Text("- Intensity")
                            .font(.title)
                            .foregroundStyle(.blue)
                            .padding()
                        IntensityInputView()
                    } else {
                        Text("+ Intensity")
                            .font(.title)
                            .foregroundStyle(.blue)
                            .padding()
                    }
                }
            }
            
            
            //Level Attribute
            Button(action : {
                withAnimation {
                    self.isExpandedLevel.toggle()
                }
            }) {
                VStack {

                    //Expand LevelPickerView
                    if isExpandedLevel {
                        Text("- Level")
                            .font(.title)
                            .foregroundStyle(.blue)
                            .padding()
                        LevelInputView()
                    } else {
                        Text("+ Level")
                            .font(.title)
                            .foregroundStyle(.blue)
                            .padding()
                    }
                }
            }
        }
    }
}

#Preview {
    NewExerciseModalView(viewModel: ExerciseViewModel.sample())
}
