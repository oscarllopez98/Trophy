//
//  ExerciseCardListView.swift
//  Trophy
//
//  Created by Oscar Lopez on 7/13/24.
//

import SwiftUI

struct ExerciseCardListView: View {
    
    @ObservedObject var viewModel: ExerciseCardListViewModel
    
    var body: some View {
        VStack {
            if viewModel.isLoading {
                VStack {
                    Spacer()
                    Text("Loading exercises...")
                        .font(.headline)
                        .multilineTextAlignment(.center)
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else if viewModel.exercises.isEmpty {
                VStack {
                    Text("You don't have any Exercises tracked yet!")
                        .font(.headline)
                    
                    Text("Click the + icon below to get started.")
                        .font(.subheadline)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding()
            } else {
                List {
                    ForEach(viewModel.exercises, id: \.id) { exercise in
                        let exerciseCardViewModel = ExerciseCardViewModel(exercise: exercise)
                        ExerciseCardView(viewModel: exerciseCardViewModel)
                            .swipeActions(edge: .trailing) {
                                Button(action: {
                                    // Handle delete action here
                                    deleteExercise(exercise)
                                }) {
                                    Label("Delete", systemImage: "trash")
                                }
                                .tint(.red)
                            }
                    }
                }
                .listStyle(PlainListStyle())  // Removes default list styling
                .background(Color.clear)
                .padding(0)  // Removes padding around the list
                .frame(maxWidth: .infinity, maxHeight: .infinity)  // Ensures List takes full width and height
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    private func deleteExercise(_ exercise: Exercise) {
        // Implement the deletion logic here
        
        // You may need to notify a parent view or perform additional actions
        print("Deleting exercise: \(exercise.name)")
    }
}

#Preview {
    ExerciseCardListView(viewModel: ExerciseCardListViewModel.sample())
        .previewLayout(.sizeThatFits)
}
