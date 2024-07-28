//
//  ExerciseDetailView.swift
//  Trophy
//
//  Created by Oscar Lopez on 7/14/24.
//

import SwiftUI

struct ExerciseDetailView: View {
    @ObservedObject var viewModel: ExerciseCardViewModel

    var body: some View {
        VStack {
            Text(viewModel.exercise.name)
                .font(.largeTitle)
                .padding()
            
            Text(viewModel.exercise.date, style: .date)
                .font(.subheadline)
                .padding()
            
            List(viewModel.exercise.attributes.sorted(by: { $0.key.rawValue < $1.key.rawValue }), id: \.key.rawValue) { key, attribute in
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
                        .font(.body)
                }
            }
            .listStyle(PlainListStyle())
        }
        .padding()
    }
}

#Preview {
    ExerciseDetailView(viewModel: ExerciseCardViewModel.sample())
        .previewLayout(.sizeThatFits)
}
