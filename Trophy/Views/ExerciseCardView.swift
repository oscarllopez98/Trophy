//
//  ExerciseCardView.swift
//  Trophy
//
//  Created by Oscar Lopez on 3/3/24.
//

import SwiftUI

struct ExerciseCardView: View {
    @ObservedObject var viewModel: ExerciseCardViewModel
    
    // Dimensions and other constants
    let exerciseCardViewOpacity: Double = 0.1
    let exerciseCardViewCornerSize: CGFloat = 10
    
    var body: some View {
        HStack {
            VStack {
                // Top Row
                HStack {
                    Text(viewModel.exercise.name)
                    Spacer()
                    Text(viewModel.exercise.date, style: .date)
                }
                Spacer()
                // Bottom Row
                HStack {
                    ForEach(viewModel.displayedAttributes) { attribute in
                        HStack {
                            Image(systemName: attribute.name) // Assume attribute.name maps to a valid SF Symbol
                            Text(attribute.value.description) // Assuming attribute.value conforms to CustomStringConvertible
                        }
                        Spacer()
                    }
                    // Fill remaining space with empty Spacers
                    ForEach(viewModel.displayedAttributes.count..<3) { _ in
                        Spacer()
                    }
                }
            }
            .padding()
            .background(Color.gray.opacity(exerciseCardViewOpacity))
        }
        .border(Color.black)
        .clipShape(RoundedRectangle(
            cornerSize: CGSize(
                width: exerciseCardViewCornerSize,
                height: exerciseCardViewCornerSize)))
        .padding()
    }
}

#Preview {
    ExerciseCardView(viewModel: ExerciseCardViewModel.sample())
        .previewLayout(.sizeThatFits)
}



#Preview {
    ExerciseCardView(viewModel: ExerciseCardViewModel.sample())
        .previewLayout(.sizeThatFits)
}
