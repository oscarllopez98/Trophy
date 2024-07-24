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
                    let exercise = createExercise()
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

    private func createExercise() -> Exercise {
        var attributes: [Exercise.AttributeName: ExerciseAttribute] = [:]

        if let distance = Double(viewModel.distanceViewModel.selectedDistance), distance > 0 {
            attributes[.distance] = DistanceAttribute(distance: distance,
                                                      unit: DistanceUnit(stringValue: viewModel.distanceViewModel.selectedDistanceUnit.rawValue))
        }
        let time = TimeInterval(viewModel.timeViewModel.selectedHours * 3600 +
                                viewModel.timeViewModel.selectedMinutes * 60 +
                                viewModel.timeViewModel.selectedSeconds)
        if time > 0 {
            attributes[.time] = TimeAttribute(time: time)
        }
        if let sets = Int(viewModel.setsViewModel.selectedSets), sets > 0 {
            attributes[.sets] = SetsAttribute(sets: sets)
        }
        if let reps = Int(viewModel.repsViewModel.selectedReps), reps > 0 {
            attributes[.reps] = RepsAttribute(reps: reps)
        }
        if let weight = Double(viewModel.weightViewModel.selectedWeight), weight > 0 {
            attributes[.weight] = WeightAttribute(weight: weight,
                                                  unit: WeightUnit(weightString: viewModel.weightViewModel.selectedWeightUnit.rawValue)!)
        }
        if viewModel.intensityViewModel.selectedIntensity != .unset {
            attributes[.intensity] = IntensityAttribute(intensityString: viewModel.intensityViewModel.selectedIntensity.rawValue)
        }
        if viewModel.levelViewModel.selectedLevelUnitIndex > 0 {
            attributes[.level] = LevelAttribute(levelInt: viewModel.levelViewModel.selectedLevelUnitIndex)
        }

        return Exercise(name: exerciseName, type: .other, attributes: attributes, date: .now)
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
