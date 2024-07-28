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
    @ObservedObject var viewModel: AddEntryViewModel
    @ObservedObject var summaryViewModel: SummaryViewModel
    @Binding var activePage: NavigationBar.Page?
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""
    let userId: String

    // Symbol displayed in the Default Title
    let writingSymbolSystemName: String = "pencil.line"

    var body: some View {
        Spacer()
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
                if newValue.count > 20 {
                    exerciseName = String(newValue.prefix(20))
                }
                if !isEdited && newValue != getDefaultTitle() {
                    isEdited = true
                }
            }
            Button("Save") {
                if exerciseName.isEmpty {
                    alertMessage = "You need to have an exercise name to continue."
                    showAlert = true
                } else if !viewModel.hasValidAttributes() {
                    alertMessage = "You need to fill out at least 1 exercise attribute."
                    showAlert = true
                } else {
                    let exercise = viewModel.createExercise(exerciseName: exerciseName)
                    summaryViewModel.prepareSummary(from: viewModel)
                    summaryViewModel.exercise = exercise
                    summaryViewModel.exerciseName = exerciseName // Pass the exercise name
                    summaryViewModel.userId = userId
                    activePage = .summary
                }
            }
            .buttonStyle(.bordered)
            .padding()
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Validation Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
            Spacer()
        }

        ScrollView {
            VStack(alignment: .leading) {
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
    let abbreviatedDayOfWeek = String(dayOfWeek.prefix(3))

    // Check if Morning
    if (hour >= 4 && hour < 12) {
        return "\(abbreviatedDayOfWeek) Morning Exer."
    }
    // Else, Check if Afternoon
    else if (hour >= 12 && hour < 18){
        return "\(abbreviatedDayOfWeek) Afternoon Exer."
    }
    // Else, Check if Evening
    else if (hour >= 18 && hour < 21) {
        return "\(abbreviatedDayOfWeek) Evening Exer."
    }
    // Else, Set Night
    else {
        return "\(abbreviatedDayOfWeek) Night Exer."
    }
}

#Preview {
    AddEntryView(viewModel: AddEntryViewModel(), summaryViewModel: SummaryViewModel(userId: "sampleId"), activePage: .constant(.addEntry), userId: "sampleUserId")
}
