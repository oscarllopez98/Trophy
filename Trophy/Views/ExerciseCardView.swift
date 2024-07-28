//
//  ExerciseCardView.swift
//  Trophy
//
//  Created by Oscar Lopez on 3/3/24.
//

import SwiftUI

struct ExerciseCardView: View {
    @ObservedObject var viewModel: ExerciseCardViewModel
    @State private var isSheetPresented = false

    // Dimensions and other constants
    let exerciseCardViewOpacity: Double = 0.07
    let exerciseCardViewCornerSize: CGFloat = 10
    let cardHeight: CGFloat = 130  // Set the height of the card
    let cardDateOpacity: Double = 0.85

    var body: some View {
        VStack {
            HStack {
                VStack {
                    // Top Row
                    HStack {
                        Text(viewModel.exercise.name)
                            .fontWeight(.bold)
                        Spacer()
                        Text(viewModel.exercise.date, style: .date)
                            .foregroundStyle(.gray).opacity(cardDateOpacity)
                    }
                    Spacer()
                    // Bottom Row
                    HStack(spacing: 0) {
                        ForEach(viewModel.displayedAttributes.sorted(by: { $0.key.rawValue < $1.key.rawValue }), id: \.key.rawValue) { key, attribute in
                            
                            // Lowercase the name
                            let attributeNameLowercased = attribute.name.lowercased()
                            
                            // Check some edge cases for naming conventions
                            let attributeName: String =
                                attributeNameLowercased == Exercise.AttributeName.time.rawValue ||
                                attributeNameLowercased == Exercise.AttributeName.intensity.rawValue
                                ? "" : attribute.name
                            
                            // Get Attribute Value
                            let attributeValue: String = attribute.value.stringValue
                            
                            // If appropriate, get Attribute Unit
                            let attributeUnit: String? = attribute.unit?.symbolAsString
                            
                            // Format text to display
                            let attributeText = (attributeUnit != nil) ? "\(attributeValue) \(attributeUnit!)" : "\(attributeValue) \(attributeName)"
                            
                            // Display View
                            HStack {
                                Image(systemName: attribute.systemName)
                                
                                Text(attributeText)
                                    .font(.footnote)
                                    .fontWeight(.bold)
                            }
                            .frame(maxWidth: .infinity)
                        }
                        
                        // Fill remaining space with empty VStacks
                        ForEach(viewModel.displayedAttributes.count..<3) { _ in
                            VStack(alignment: .leading) {
                                Spacer()
                            }
                            .frame(maxWidth: .infinity)
                        }
                    }
                }
                .padding()
                .frame(height: cardHeight)  // Set the height of the VStack
                .background(Color.gray.opacity(exerciseCardViewOpacity))
                .clipShape(RoundedRectangle(
                    cornerSize: CGSize(
                        width: exerciseCardViewCornerSize,
                        height: exerciseCardViewCornerSize)))
                .onTapGesture {
                    isSheetPresented = true
                }
                .sheet(isPresented: $isSheetPresented) {
                    ExerciseDetailView(viewModel: viewModel)
                }
            }
        }
    }

    private func deleteExercise() {
        // Implement the deletion logic here
        // You may need to notify a parent view or perform additional actions
        print("Hi")
    }
}

#Preview {
    ExerciseCardView(viewModel: ExerciseCardViewModel.sample())
        .previewLayout(.sizeThatFits)
}
