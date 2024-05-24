import SwiftUI

struct ContentView: View {
    // Tracks the Dynamic List of Exercises
    @StateObject var exerciseListViewModel: ExerciseListViewModel
    @State private var isModalVisible = false

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
                            // Display each ExerciseCardView
                            ForEach(Array(exerciseListViewModel.exercises.enumerated()), id: \.element.id) { index, exercise in
                                ExerciseCardView(viewModel: ExerciseViewModel(exercise: exercise))
                                    .padding(index == 0 ? [.horizontal, .top] : .horizontal)
                            }
                            
                            // If no exercises, inform user how to add exercises
                            if exerciseListViewModel.exercises.isEmpty {
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
                        ActionBarView(isModalVisible: $isModalVisible, exerciseListViewModel: exerciseListViewModel)
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
            NewExerciseModalView(viewModel: NewExerciseModalViewModel(exerciseListViewModel: exerciseListViewModel), isModalVisible: $isModalVisible)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(exerciseListViewModel: ExerciseListViewModel(userId: "4bf0e7ef-cd19-4b0c-b9a2-e946c58e01d1"))
    }
}
