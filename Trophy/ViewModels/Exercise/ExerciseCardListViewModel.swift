//
//  ExerciseCardListViewModel.swift
//  Trophy
//
//  Created by Oscar Lopez on 7/13/24.
//

import Combine
import Foundation

@MainActor
class ExerciseCardListViewModel: ObservableObject {
    @Published var exercises: [Exercise] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: IdentifiableError? = nil
    private var fetchTask: Task<Void, Never>? = nil

    let userId: String

    init(userId: String) {
        self.userId = userId
    }

    func fetchExercisesIfNeeded() {
        if fetchTask == nil {
            fetchTask = Task {
                await fetchExercises(userId: userId)
                fetchTask = nil
            }
        }
    }

    func fetchExercises(userId: String) async {
        print("Fetching exercises for userId: \(userId)")
        self.isLoading = true

        do {
            let fetchedExercises = try await TrophyRESTAPI().GETLimitedUserExercises(userId: userId)
            self.exercises = fetchedExercises
            self.isLoading = false
        } catch {
            self.errorMessage = IdentifiableError(message: error.localizedDescription)
            self.isLoading = false
        }
    }
    
    static func sample() -> ExerciseCardListViewModel {
        let userId: String = "getEnvironmentVariable(\"TEST_USER_ID\")!"
        return ExerciseCardListViewModel(userId: userId)
    }
}
