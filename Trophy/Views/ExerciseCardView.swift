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
                Spacer()
                // Bottom Row
                // AttributeType : ExerciseAttribute
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
            .background(Color.gray.opacity(exerciseCardViewOpacity))
        }
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


#Preview {
    ExerciseCardView(viewModel: ExerciseCardViewModel.sample())
        .previewLayout(.sizeThatFits)
}
