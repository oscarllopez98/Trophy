//
//  SummaryViewModel.swift
//  Trophy
//
//  Created by Oscar Lopez on 7/15/24.
//

import Foundation

class SummaryViewModel: ObservableObject {
    var userId: String
    @Published var summaryItems: [String] = []
    var exercise: Exercise?

    init(userId: String) {
        self.userId = userId
    }

    func prepareSummary(from viewModel: AddEntryViewModel) {
        var items: [String] = []
        
        if !viewModel.exerciseName.isEmpty {
            items.append("Name: \(viewModel.exerciseName)")
        }
        if let distance = Double(viewModel.distanceViewModel.selectedDistance), distance > 0 {
            items.append("Distance: \(distance) \(viewModel.distanceViewModel.selectedDistanceUnit.rawValue)")
        }
        let time = TimeInterval(viewModel.timeViewModel.selectedHours * 3600 +
                                viewModel.timeViewModel.selectedMinutes * 60 +
                                viewModel.timeViewModel.selectedSeconds)
        if time > 0 {
            items.append("Time: \(viewModel.timeViewModel.selectedHours)h \(viewModel.timeViewModel.selectedMinutes)m \(viewModel.timeViewModel.selectedSeconds)s")
        }
        if let sets = Int(viewModel.setsViewModel.selectedSets), sets > 0 {
            items.append("Sets: \(sets)")
        }
        if let reps = Int(viewModel.repsViewModel.selectedReps), reps > 0 {
            items.append("Reps: \(reps)")
        }
        if let weight = Double(viewModel.weightViewModel.selectedWeight), weight > 0 {
            items.append("Weight: \(weight) \(viewModel.weightViewModel.selectedWeightUnit.rawValue)")
        }
        if !viewModel.intensityViewModel.selectedIntensity.isEmpty {
            items.append("Intensity: \(viewModel.intensityViewModel.selectedIntensity)")
        }
        if viewModel.levelViewModel.selectedLevelUnitIndex > 0 {
            items.append("Level: \(viewModel.levelViewModel.selectedLevelUnitIndex)")
        }

        summaryItems = items
        print(summaryItems)
    }

    func confirm(exercise: Exercise) async {
        print("Third: \(exercise.name)")
        let trophyRestAPI: TrophyRESTAPI = TrophyRESTAPI()
        print("womp", userId)
        if let exerciseId = await trophyRestAPI.PUTUserExercise(exercise: exercise, userId: userId) {
            print("Received exercise ID: \(exerciseId)")
        } else {
            print("Failed to receive exercise ID.")
        }
    }
}
