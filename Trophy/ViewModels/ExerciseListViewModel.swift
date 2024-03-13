//
//  ExerciseListViewModel.swift
//  Trophy
//
//  Created by Oscar Lopez on 3/13/24.
//

import SwiftUI
import Combine

class ExerciseListViewModel: ObservableObject {
    @Published var exercises: [Exercise] = []

    private var cancellables = Set<AnyCancellable>()

    init() {
        MockExerciseDatabase.shared.$exercises
            .assign(to: \.exercises, on: self)
            .store(in: &cancellables)
    }
}
