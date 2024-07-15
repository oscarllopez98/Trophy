//
//  AddEntryView.swift
//  Trophy
//
//  Created by Oscar Lopez on 7/14/24.
//

import SwiftUI

struct AddEntryView: View {
    @ObservedObject var viewModel: AddEntryViewModel
    @Binding var activePage: NavigationBar.Page  // Binding for active page

    var body: some View {
        VStack {
            TextField("Enter Exercise Name", text: $viewModel.exerciseName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            DistanceInputView(viewModel: viewModel.distanceViewModel)
            
            TimeInputView(viewModel: viewModel.timeViewModel)
            
            SetsInputView(viewModel: viewModel.setsViewModel)
            
            RepsInputView(viewModel: viewModel.repsViewModel)
            
            WeightInputView(viewModel: viewModel.weightViewModel)
            
            IntensityInputView(viewModel: viewModel.intensityViewModel)
            
            LevelInputView(viewModel: viewModel.levelViewModel)
            
            Button("Save") {
                // Implement save action
                viewModel.saveExercise()
                activePage = .home  // Navigate back to home after saving
            }
            .buttonStyle(.bordered)
            .padding()
        }
        .padding()
    }
}

#Preview {
    AddEntryView(viewModel: AddEntryViewModel(), activePage: .constant(.addEntry))
}
