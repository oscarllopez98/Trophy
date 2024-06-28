import SwiftUI

struct ContentView: View {
    // Tracks the Dynamic List of Exercises
    @StateObject var exerciseListViewModel: ExerciseListViewModel
    @State private var isModalVisible = false
    var userId: String
    var username: String

    var body: some View {
        // Our Main Container
        GeometryReader { geometry in
            VStack(spacing: 0) {
                // MARK: Navbar
                HStack {
                    Text("Navbar")
                }
                .frame(width: geometry.size.width, height: geometry.size.height * 0.1)
                .background(Color("PrimaryColor"))
                
                // MARK: Bodybar
                HStack {
                    GeometryReader { scrollGeo in
                        ScrollView {
                            // Show loading indicator while loading
                            if exerciseListViewModel.isLoading {
                                VStack {
                                    Spacer()
                                    Text("Loading exercises...")
                                        .font(.headline)
                                        .foregroundStyle(Color("EmptyListTextColor"))
                                        .multilineTextAlignment(.center)
                                    Spacer()
                                }
                                .frame(height: geometry.size.height * 0.80)
                            }
                            // If no exercises, inform user how to add exercises
                            else if exerciseListViewModel.exercises.isEmpty {
                                VStack {
                                    Spacer()
                                    Text("You don't have any Exercises tracked yet!")
                                        .font(.headline)
                                        .foregroundStyle(Color("EmptyListTextColor"))
                                        .multilineTextAlignment(.center)
                                    Text("Click the + icon below to get started.")
                                        .font(.subheadline)
                                        .foregroundStyle(Color("EmptyListTextColor"))
                                        .multilineTextAlignment(.center)
                                    Spacer()
                                }
                                .frame(height: geometry.size.height * 0.80)
                            } else {
                                // Display each ExerciseCardView
                                ForEach(Array(exerciseListViewModel.exercises.enumerated()), id: \.element.id) { index, exercise in
                                    ExerciseCardView(viewModel: ExerciseViewModel(exercise: exercise))
                                        .padding(index == 0 ? [.horizontal, .top] : .horizontal)
                                }
                            }
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color("SecondaryColor"))
                    }
                }
                .frame(width: geometry.size.width, height: geometry.size.height * 0.80)
                .background(.blue)
                
                // MARK: Actionbar
                GeometryReader { actionBarGeo in
                    HStack {
                        ActionBarView(isModalVisible: $isModalVisible, exerciseListViewModel: exerciseListViewModel, userId: userId)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .onTapGesture {
                                // Show modal for adding a new exercise
                                isModalVisible.toggle()
                            }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                .background(Color("PrimaryColor"))
                .frame(maxWidth: .infinity)
            } // VStack
            .frame(width: geometry.size.width, height: geometry.size.height)
        } // GeometryReader
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .alert(item: $exerciseListViewModel.errorMessage) { error in
            Alert(title: Text("Error"), message: Text(error.message), dismissButton: .default(Text("OK")))
        }
        .sheet(isPresented: $isModalVisible) {
            NewExerciseModalView(viewModel: NewExerciseModalViewModel(exerciseListViewModel: exerciseListViewModel, userId: userId), isModalVisible: $isModalVisible)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        var sampleID: String = "4bf0e7ef-cd19-4b0c-b9a2-e946c58e01d1"
        var sampleUsername: String = "Test User"
        ContentView(exerciseListViewModel: ExerciseListViewModel(userId: sampleID),
                    userId: sampleID,
                    username: sampleUsername
                    )
    }
}
