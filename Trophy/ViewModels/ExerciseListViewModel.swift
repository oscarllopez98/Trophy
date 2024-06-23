import SwiftUI
import Combine

class ExerciseListViewModel: ObservableObject {
    @Published var exercises: [Exercise] = []
    @Published var errorMessage: IdentifiableError? = nil
    @Published var isLoading: Bool = false
    @Published var initialLoad: Bool = true
    private var cancellables = Set<AnyCancellable>()
    private var timer: Timer?
    private let pollingInterval: TimeInterval = 30.0
    private var lastExerciseCount: Int = 0

    init(userId: String) {
        startPolling(userId: userId)
    }

    func startPolling(userId: String) {
        // Immediately fetch exercises on initialization within the MainActor context
        Task { @MainActor in
            await fetchExercises(userId: userId)
        }

        // Set up the timer to fetch exercises at regular intervals
        timer = Timer.scheduledTimer(withTimeInterval: pollingInterval, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            // Fetch exercises periodically within the MainActor context
            Task { @MainActor in
                await self.fetchExercises(userId: userId)
            }
        }
        
        // Cancel the initial timer fire to avoid double execution
        timer?.fireDate = Date().addingTimeInterval(pollingInterval)
    }


    deinit {
        timer?.invalidate()
    }

    @MainActor
    func fetchExercises(userId: String) async {
        print("Fetching exercises for userId: \(userId)") // Debug print
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
