import SwiftUI
import Combine

class ExerciseListViewModel: ObservableObject {
    @Published var exercises: [Exercise] = []
    @Published var errorMessage: IdentifiableError? = nil // Updated to IdentifiableError

    private var cancellables = Set<AnyCancellable>()
    
    init(userId: String) {
        Task {
            await fetchExercises(userId: userId)
        }
    }
    
    func fetchExercises(userId: String) async {
        do {
            let fetchedExercises = try await TrophyRESTAPI().GETLimitedUserExercises(userId: userId)
            DispatchQueue.main.async {
                self.exercises = fetchedExercises
            }
        } catch {
            DispatchQueue.main.async {
                self.errorMessage = IdentifiableError(message: error.localizedDescription)
            }
        }
    }
}
