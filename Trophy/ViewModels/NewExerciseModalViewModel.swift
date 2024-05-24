import Foundation

class NewExerciseModalViewModel: ObservableObject {
    // Reference to the list view model to notify about updates
    private var exerciseListViewModel: ExerciseListViewModel

    // State values for Custom Input Views
    @Published var newExerciseTitle: String = ""
    @Published var isModalVisible = false
    
    // View models for input views
    @Published var distanceInputViewModel = DistanceInputViewModel()
    @Published var timeInputViewModel = TimeInputViewModel()
    @Published var setsInputViewModel = SetsInputViewModel()
    @Published var repsInputViewModel = RepsInputViewModel()
    @Published var weightInputViewModel = WeightInputViewModel()
    @Published var intensityInputViewModel = IntensityInputViewModel()
    @Published var levelInputViewModel = LevelInputViewModel()
    
    // State trackers for expanded animation
    @Published var isExpandedDistance = false
    @Published var isExpandedTime = false
    @Published var isExpandedSets = false
    @Published var isExpandedReps = false
    @Published var isExpandedWeight = false
    @Published var isExpandedIntensity = false
    @Published var isExpandedLevel = false
    
    // Error handling
    @Published var errorMessage: IdentifiableError? = nil

    // Initializer
    init(exerciseListViewModel: ExerciseListViewModel) {
        self.exerciseListViewModel = exerciseListViewModel
    }

    // Submit Exercise function
    func submit() async {
        // Log all the current values where isExpanded == true
        print("Submit!")
        
        // Print Distance
        print("Distance: \(distanceInputViewModel.selectedDistance)")
        // Print Time
        print("Time (HH:MM:SS): \(timeInputViewModel.selectedHours):\(timeInputViewModel.selectedMinutes):\(timeInputViewModel.selectedSeconds)")
        // Print Sets
        print("Sets: \(setsInputViewModel.selectedSets)")
        // Print Reps
        print("Reps: \(repsInputViewModel.selectedReps)")
        // Print Weight
        print("Weight: \(weightInputViewModel.selectedWeight)")
        // Print Intensity
        print("Intensity: \(intensityInputViewModel.selectedIntensity)")
        // Print Level
        print("Level Index: \(levelInputViewModel.selectedLevelUnitIndex)")
        
        // TODO: Do validations here
        
        var attributes: [Exercise.AttributeName: ExerciseAttribute] = [:]
        
        // Add Distance to Attributes if Expanded
        if isExpandedDistance {
            if let distance = Double(distanceInputViewModel.selectedDistance) {
                attributes[.distance] = DistanceAttribute(distance: distance,
                                                          unit: DistanceUnit(distanceSymbol: DistanceUnit.Symbol.allCases[distanceInputViewModel.selectedDistanceUnitIndex]))
            }
        }
        
        // Add Time to Attributes if Expanded
        if isExpandedTime {
            let hours = Double(timeInputViewModel.selectedHours)
            let minutes = Double(timeInputViewModel.selectedMinutes)
            let seconds = Double(timeInputViewModel.selectedSeconds)
            
            let totalSeconds = hours * 3600 + minutes * 60 + seconds
            let time = TimeInterval(totalSeconds)
            
            attributes[.time] = TimeAttribute(time: time)
        }
        
        // Add Reps to Attributes if Expanded
        if isExpandedReps {
            if let reps = Int(repsInputViewModel.selectedReps) {
                attributes[.reps] = RepsAttribute(reps: reps)
            }
        }
        
        // Add Sets to Attributes if Expanded
        if isExpandedSets {
            if let sets = Int(setsInputViewModel.selectedSets) {
                attributes[.sets] = SetsAttribute(sets: sets)
            }
        }
        
        // Add Weight to Attributes if Expanded
        if isExpandedWeight {
            if let weight = Double(weightInputViewModel.selectedWeight) {
                attributes[.weight] = WeightAttribute(weight: weight,
                                                      unit: WeightUnit(weightSymbol: WeightUnit.Symbol.allCases[weightInputViewModel.selectedWeightUnitIndex]))
            }
        }
        
        // Add Intensity to Attributes if Expanded
        if isExpandedIntensity {
            attributes[.intensity] = IntensityAttribute(value: IntensityAttribute.Intensity.allCases[intensityInputViewModel.selectedIntensityUnitIndex])
        }
        
        // Add Level to Attributes if Expanded
        if isExpandedLevel {
            attributes[.level] = LevelAttribute(value: LevelAttribute.Level.allCases[levelInputViewModel.selectedLevelUnitIndex])
        }
        
        // Create Exercise that will be stored in the Database
        let exercise = Exercise(name: newExerciseTitle,
                                type: .other,
                                attributes: attributes,
                                date: Date(),
                                duration: nil,
                                notes: nil)
        print(exercise)
        
        // Store Exercise in Database using PUTUserExercise
        do {
            if let response = await TrophyRESTAPI().PUTUserExercise(exercise: exercise) {
                print("Exercise stored successfully: \(response)")
                // Notify the ExerciseListViewModel to refresh its data
                await exerciseListViewModel.fetchExercises(userId: "4bf0e7ef-cd19-4b0c-b9a2-e946c58e01d1")
            } else {
                throw APIError.PUTUserExerciseFailed(userId: "4bf0e7ef-cd19-4b0c-b9a2-e946c58e01d1", exercise: exercise)
            }
        } catch {
            print("Error storing exercise: \(error)")
            self.errorMessage = IdentifiableError(message: error.localizedDescription)
        }
    }
}
