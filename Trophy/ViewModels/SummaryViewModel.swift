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
    @Published var exercise: Exercise?
    @Published var exerciseName: String = ""


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
        if viewModel.intensityViewModel.selectedIntensity != .unset {
            items.append("Intensity: \(viewModel.intensityViewModel.selectedIntensity.rawValue)")
        }
        if viewModel.levelViewModel.selectedLevel != .NA {
            items.append("Level: \(viewModel.levelViewModel.selectedLevel.rawValue)")
        }

        summaryItems = items
        print(summaryItems)
    }
    
    func confirm(exercise: Exercise) async {
        ExerciseLogger().logExercise(exercise)
        let trophyRESTAPI: TrophyRESTAPI = TrophyRESTAPI()
        let exerciseId: String = await trophyRESTAPI.PUTUserExercise(exercise: exercise, userId: userId) ?? "Error: Confirm failed getting Exercise ID"
        print(exerciseId)
    }
}
