import SwiftUI
import Combine

class ExerciseListViewModel: ObservableObject {
    // Published array of Exercise objects to be displayed in the UI
    @Published var exercises: [Exercise] = []
    
    // Published error message to be displayed in case of an error
    @Published var errorMessage: IdentifiableError? = nil
    
    // Published boolean to indicate loading state of the exercises
    @Published var isLoading: Bool = false
    
    // Published boolean to track if it's the initial load of exercises
    @Published var initialLoad: Bool = true
    
    // Set to hold Combine's cancellables for any subscriptions
    private var cancellables = Set<AnyCancellable>()
    
    // Timer object to schedule periodic polling for new exercises
    private var timer: Timer?    
    private let pollingInterval: TimeInterval = 30.0
    
    // Variable to keep track of the count of exercises from the last fetch
    private var lastExerciseCount: Int = 0

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
        // Set loading state immediately on the main thread
        DispatchQueue.main.async {
            if self.initialLoad {
                self.isLoading = true
            }
        }

        do {
            let fetchedExercises = try await TrophyRESTAPI().GETLimitedUserExercises(userId: userId)
            DispatchQueue.main.async {
                // Check if new exercises were added
                if fetchedExercises.count != self.lastExerciseCount {
                    self.exercises = fetchedExercises
                    self.lastExerciseCount = fetchedExercises.count
                    self.isLoading = false
                } else {
                    self.isLoading = false
                }
                self.initialLoad = false
            }
        } catch {
            DispatchQueue.main.async {
                self.errorMessage = IdentifiableError(message: error.localizedDescription)
                self.isLoading = false
            }
        }
    }
}
