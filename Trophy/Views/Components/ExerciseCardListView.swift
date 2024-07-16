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
        // Main Container
        ScrollView {
            if viewModel.isLoading {
                VStack {
                    Spacer()
                    Text("Loading exercises...")
                        .font(.headline)
                        .multilineTextAlignment(.center)
                    Spacer()
                }
            } else if viewModel.exercises.isEmpty {
                VStack {
                    Text("You don't have any Exercises tracked yet!")
                        .font(.headline)
                    
                    Text("Click the + icon below to get started.")
                        .font(.subheadline)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else {
                ForEach(viewModel.exercises, id: \.id) { exercise in
                    let exerciseCardViewModel = ExerciseCardViewModel(exercise: exercise)
                    ExerciseCardView(viewModel: exerciseCardViewModel)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}


#Preview {
    ExerciseCardListView(viewModel: ExerciseCardListViewModel.sample())
        .previewLayout(.sizeThatFits)
}
