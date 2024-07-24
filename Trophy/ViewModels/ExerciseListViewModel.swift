import Combine
import Foundation

@MainActor
class ExerciseListViewModel: ObservableObject {
    @Published var exercises: [Exercise] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: IdentifiableError? = nil
    var lastExerciseCount: Int = 0
    var initialLoad: Bool = true

    let userId: String

    init(userId: String) {
        self.userId = userId
        Task {
            await fetchExercises(userId: userId)
        }
    }

    func fetchExercises(userId: String) async {
        print("Fetching exercises for userId: \(userId)")
        if self.initialLoad {
            self.isLoading = true
        }

        do {
            let fetchedExercises = try await TrophyRESTAPI().GETLimitedUserExercises(userId: userId)
            if fetchedExercises.count != self.lastExerciseCount {
                self.exercises = fetchedExercises
                self.lastExerciseCount = fetchedExercises.count
            }
            self.isLoading = false
            self.initialLoad = false
        } catch {
            self.errorMessage = IdentifiableError(message: error.localizedDescription)
            self.isLoading = false
        }
    }
}
