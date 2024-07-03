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
                    // AttributeType : ExerciseAttribute
                    ForEach(viewModel.displayedAttributes.sorted(by: { $0.key.rawValue < $1.key.rawValue }), id: \.key.rawValue) { key, attribute in
                        HStack {
                            Image(systemName: attribute.systemName)
                            let attributeNameLowercased = attribute.name.lowercased()
                            let attributeName: String =
                                attributeNameLowercased == Exercise.AttributeName.time.rawValue ||
                                attributeNameLowercased == Exercise.AttributeName.intensity.rawValue
                            ? "" : attribute.name
                            let attributeValue: String = attribute.value.stringValue
                            let attributeUnit: String? = attribute.unit?.symbolAsString
                            
                            let attributeText = (attributeUnit != nil) ? "\(attributeValue) \(attributeUnit!)" : "\(attributeValue) \(attributeName)"
                            
                            Text(attributeText)
                                .font(.footnote)
                        }
                        Spacer()
                    }
//                    // Fill remaining space with empty Spacers
//                    ForEach(viewModel.displayedAttributes.count..<3) { _ in
//                        Spacer()
//                    }
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
