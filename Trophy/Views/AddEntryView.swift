//
//  AddEntryView.swift
//  Trophy
//
//  Created by Oscar Lopez on 7/14/24.
//

import SwiftUI

struct AddEntryView: View {
    @State private var exerciseName: String = getDefaultTitle()
    @ObservedObject var viewModel: AddEntryViewModel
    @Binding var activePage: NavigationBar.Page?
    
    // Symbol displayed in the Default Title
    let writingSymbolSystemName: String = "pencil.line"
    

    var body: some View {
        ScrollView {
            VStack {
                Spacer()
                TextFieldWithImage(
                    text: $exerciseName,
                    placeholder: "Enter Exercise Name",
                    systemImageName: writingSymbolSystemName
                )
                .padding()
                Spacer()
                
                DistanceInputView(viewModel: viewModel.distanceViewModel)
                
                TimeInputView(viewModel: viewModel.timeViewModel)
                
                SetsInputView(viewModel: viewModel.setsViewModel)
                
                RepsInputView(viewModel: viewModel.repsViewModel)
                
                WeightInputView(viewModel: viewModel.weightViewModel)
                
                IntensityInputView(viewModel: viewModel.intensityViewModel)
                
                LevelInputView(viewModel: viewModel.levelViewModel)
                
                Button("Save") {
                    viewModel.saveExercise()
                    activePage = .home
                }
                .buttonStyle(.bordered)
                .padding()
            }
            .padding()
            .navigationTitle("Add Entry")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        activePage = .home
                    }) {
                        Text("Back")
                    }
                }
            }
        }
    }
}

private func getDefaultTitle() -> String {
    
    let date = Date()
    let calendar = Calendar.current
    
    // Get time of day from the current date
    let hour = calendar.component(.hour, from: date)
    
    // Get the weekday component from the current date
    let weekday = calendar.component(.weekday, from: date)

    // Convert the weekday component (1-7) to a weekday name (Sunday-Saturday)
    let weekdaySymbols = calendar.weekdaySymbols
    let dayOfWeek = weekdaySymbols[weekday - 1]
    
    // Check if Morning
    if (hour >= 4 && hour < 12) {
        return "\(dayOfWeek) Morning Exercise"
    }
    // Else, Check if Afternoon
    else if (hour >= 12 && hour < 18){
        return "\(dayOfWeek) Afternoon Exercise"
    }
    // Else, Check if Evening
    else if (hour >= 18 && hour < 21) {
        return "\(dayOfWeek) Evening Exercise"
    }
    // Else, Set Night
    else {
        return "\(dayOfWeek) Night Exercise"
    }
}

#Preview {
    AddEntryView(viewModel: AddEntryViewModel(), activePage: .constant(.addEntry))
}
