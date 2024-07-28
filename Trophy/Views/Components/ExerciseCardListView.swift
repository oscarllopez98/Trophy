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
                                    Task {
                                        await deleteExercise(exercise)
                                    }
                                }) {
                                    if viewModel.deletingExerciseId == exercise.id {
                                        ProgressView()
                                    } else {
                                        Label("Delete", systemImage: "trash")
                                    }
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

    private func deleteExercise(_ exercise: Exercise) async {
        let deleteStatus = await viewModel.deleteExercise(exercise)
        print("Delete was successful (true/false): \(deleteStatus)")
    }
}

#Preview {
    ExerciseCardListView(viewModel: ExerciseCardListViewModel(userId: "sampleUserId"))
        .previewLayout(.sizeThatFits)
}
