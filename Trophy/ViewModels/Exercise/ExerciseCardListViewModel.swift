//
//  ExerciseCardListViewModel.swift
//  Trophy
//
//  Created by Oscar Lopez on 7/13/24.
//

import Combine
import Foundation
import Amplify

@MainActor
class ExerciseCardListViewModel: ObservableObject {
    @Published var exercises: [Exercise] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: IdentifiableError? = nil
    @Published var deletingExerciseId: UUID? = nil  // Track the ID of the exercise being deleted
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
        let userId: String = getEnvironmentVariable("TEST_USER_ID")!
        return ExerciseCardListViewModel(userId: userId)
    }

    func deleteExercise(_ exercise: Exercise) async -> Bool {
        guard let exerciseId = exercise.id else { return false }
        self.deletingExerciseId = exerciseId  // Set the deletingExerciseId
        
        defer {
            self.deletingExerciseId = nil  // Reset the deletingExerciseId after the operation
        }

        do {
            let userId = try await Amplify.Auth.getCurrentUser().userId
            
            if (exerciseId.uuidString.isEmpty || userId.isEmpty) {
                print("Failed Deleting. Exercise ID {\(exerciseId.uuidString)} or UserId {\(userId)} is empty")
                return false
            }
            
            print("Attempting to delete exercise for userID \(userId) with exerciseId \(exerciseId)")
            let success = await TrophyRESTAPI().DELETEUserExercise(userId: userId, exerciseId: exerciseId.uuidString)
            if success {
                await fetchExercises(userId: userId)  // Refetch exercises after a successful delete
            }
            return success
        } catch {
            print(error.localizedDescription)
            return false
        }
    }
}
