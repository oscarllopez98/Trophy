//
//  ExerciseModalView.swift
//  Trophy
//
//  Created by Oscar Lopez on 3/3/24.
//

import SwiftUI

struct ExerciseModalView: View {
    
    @ObservedObject var viewModel: ExerciseViewModel
    
    var body: some View {
        VStack {
            Text(viewModel.getName())
                .font(.title)
                .padding()
            
            List {
                
                //Display all Exercise Attributes
                let items = viewModel.attributes
                ForEach(items.keys
                    .sorted(by: { $0.rawValue < $1.rawValue }), id: \.self) { key in
                        if let value = items[key] {
                            HStack {
                                Text("\(value.name)")
                                    .font(.headline)
                                Text("\(value.value.stringValue)")
                                    .font(.subheadline)
                                if let unit = value.unit {
                                    Text("\(unit.symbolAsString)")
                                        .font(.subheadline)
                                }
                            }
                        } else {
                            Text("ERROR: Could not locate Exercise Attribute")
                        }
                }
                
                //Save space and display Date and Duration (if it is available)
                if let duration = viewModel.getDuration_HHMMSS() {
                    //Display Date and Duration
                    LazyVGrid(columns: [GridItem(.flexible(), spacing: 8), GridItem(.flexible(), spacing: 8)], spacing: 8) {
                        ForEach(0..<1) { _ in // Adjust the number of rows as needed
                            VStack {
                                Text("Date Created")
                                    .foregroundColor(.black)
                                    .font(.headline) // Adjust font and styling as needed
                                Text("\(viewModel.getDateFormatted())")
                                    .foregroundColor(.black)
                                    .font(.subheadline) // Adjust font and styling as needed
                            }
                            
                            VStack {
                                Text("Duration")
                                    .foregroundColor(.black)
                                    .font(.headline) // Adjust font and styling as needed
                                Text("\(duration)")
                                    .foregroundColor(.black)
                                    .font(.subheadline) // Adjust font and styling as needed
                            }
                        }
                    }
                }
                //Else, duration is not set, so just display Date
                else {
                    HStack {
                        Text("Date")
                            .font(.headline)
                        Text("\(viewModel.getDateFormatted())")
                            .font(.subheadline)
                    }
                }
            
                //Display Exercise Notes if they are available
                if let notes = viewModel.getNotes() {
                    HStack() {
                        Text("Notes")
                            .font(.headline)
                            .foregroundStyle(.black)
                        Text("\(notes)")
                            .font(.subheadline)
                    }
                }
                
                //TODO: Make it where only certain Users can see this
                //Display Exercise ID
                HStack {
                    Text("ID")
                        .font(.headline)
                    Text("\(viewModel.getIDAsString())")
                        .font(.subheadline)
                }
            }
            .listStyle(InsetListStyle())

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
    }
    
}

//Sample Preview of the ExerciseModalView
#Preview {
    ExerciseModalView(viewModel: ExerciseViewModel.sample())
}



