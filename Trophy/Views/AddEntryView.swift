//
//  AddEntryView.swift
//  Trophy
//
//  Created by Oscar Lopez on 7/14/24.
//

import SwiftUI

struct AddEntryView: View {
    @State private var exerciseName: String = getDefaultTitle()
    @State private var isEdited: Bool = false // Track if the text field has been edited
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""
    @ObservedObject var viewModel: AddEntryViewModel
    @ObservedObject var summaryViewModel: SummaryViewModel
    @Binding var activePage: NavigationBar.Page?
    let userId: String
    
    // Symbol displayed in the Default Title
    let writingSymbolSystemName: String = "pencil.line"

    var body: some View {
        VStack {
            HStack {
                Spacer()
                TextFieldWithImage(
                    text: $exerciseName,
                    placeholder: "Enter Exercise Name",
                    systemImageName: writingSymbolSystemName,
                    isEdited: $isEdited
                )
                .padding()
                .onChange(of: exerciseName) { newValue in
                    if !isEdited && newValue != getDefaultTitle() {
                        isEdited = true
                    }
                }
                Button("Save") {
                    let validationResult = viewModel.validateInputs(exerciseName: exerciseName)
                    if validationResult.isValid {
                        viewModel.exerciseName = exerciseName
                        summaryViewModel.prepareSummary(from: viewModel)
                        activePage = .summary
                    } else {
                        alertMessage = validationResult.message
                        showAlert = true
                    }
                }
                .buttonStyle(.bordered)
                .padding()
                Spacer()
            }

            ScrollView {
                VStack {
                    DistanceInputView(viewModel: viewModel.distanceViewModel)
                    TimeInputView(viewModel: viewModel.timeViewModel)
                    SetsInputView(viewModel: viewModel.setsViewModel)
                    RepsInputView(viewModel: viewModel.repsViewModel)
                    WeightInputView(viewModel: viewModel.weightViewModel)
                    IntensityInputView(viewModel: viewModel.intensityViewModel)
                    LevelInputView(viewModel: viewModel.levelViewModel)
                }
                .padding()
            }
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
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Validation Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
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
    AddEntryView(viewModel: AddEntryViewModel(), summaryViewModel: SummaryViewModel(userId: "sampleId"), activePage: .constant(.addEntry), userId: "sampleUserId")
}
