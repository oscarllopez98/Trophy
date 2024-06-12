import SwiftUI
import Combine

class ExerciseListViewModel: ObservableObject {
    @Published var exercises: [Exercise] = []
    @Published var errorMessage: IdentifiableError? = nil

    private var cancellables = Set<AnyCancellable>()
    private var timer: Timer?
    private let pollingInterval: TimeInterval = 30.0 // Adjust the interval as needed

    /**
     Initializes the ExerciseListViewModel with a user ID and starts polling for exercises.
     
     - Parameter userId: The ID of the user whose exercises are to be fetched.
     */
    init(userId: String) {
        startPolling(userId: userId)
    }

    /**
     Starts the polling process to fetch exercises periodically.
     
     - Parameter userId: The ID of the user whose exercises are to be fetched.
     */
    func startPolling(userId: String) {
        // Immediately fetch exercises on initialization
        Task {
            await fetchExercises(userId: userId)
        }

        // Set up the timer to fetch exercises at regular intervals
        timer = Timer.scheduledTimer(withTimeInterval: pollingInterval, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            Task {
                await self.fetchExercises(userId: userId)
            }
        }
    }

    /**
     Invalidates the timer when the view model is deinitialized.
     */
    deinit {
        timer?.invalidate()
    }

    /**
     Fetches the exercises for a given user and updates the published `exercises` property.
     
     - Parameter userId: The ID of the user whose exercises are to be fetched.
     */
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
