//
//  NewExerciseModalView.swift
//  Trophy
//
//  Created by Oscar Lopez on 3/4/24.
//

import SwiftUI

struct NewExerciseModalView: View {
    
    @StateObject var viewModel: NewExerciseModalViewModel
    @Binding var isModalVisible: Bool
        
    let addSymbol: Image = Image(systemName: "plus.circle")
    let minusSymbol: Image = Image(systemName: "minus.circle")
    
    let textForegroundeStyleColor: Color = .primary
    let addSymbolForegroundStyleColor: Color = .green
    let minusSymbolForegroundStyleColor: Color = .red
    
    let submitRowHeight = CGFloat(40)
    
    var body: some View {
        
        GeometryReader { geometry in
            VStack {
                GeometryReader { row in
                    HStack {
                        
                        //Enter Exercise Title TextField
                        TextField (
                            "Enter Exercise Title",
                            text: $viewModel.newExerciseTitle
                        )
                        .frame(maxWidth: row.size.width * 0.7,
                               maxHeight: .infinity)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                        
                        //Submit Button
                        Button(action: {
                            viewModel.submit()
                            //TODO: Call ViewModel to do some checks
                            isModalVisible = false
                        }) {
                            RoundedRectangle(cornerRadius: 20)
                                .overlay(
                                    Text("Submit")
                                        .foregroundStyle(Color.white)
                                )
                        }
                        .frame(maxWidth: row.size.width * 0.3,
                               maxHeight: .infinity)
                        .padding(.horizontal)
                    }
                    .frame(maxWidth: .infinity, maxHeight: row.size.height)
                    .padding(.top)

                }
                .frame(maxWidth: .infinity, maxHeight: submitRowHeight)



                ScrollView {
                    VStack {
                        //MARK: Distance
                        Button(action : {
                            withAnimation {
                                viewModel.isExpandedDistance.toggle()
                            }
                        }) {
                            if viewModel.isExpandedDistance {
                                HStack {
                                    Text("Distance")
                                        .font(.title)
                                        .foregroundStyle(textForegroundeStyleColor)
                                        .padding()
                                    Spacer()
                                    Text("\(minusSymbol)")
                                        .font(.title)
                                        .foregroundStyle(minusSymbolForegroundStyleColor)
                                        .padding()
                                }
                            } else {
                                HStack {
                                    Text("Distance")
                                        .font(.title)
                                        .foregroundStyle(textForegroundeStyleColor)
                                        .padding()
                                    Spacer()
                                    Text("\(addSymbol)")
                                        .font(.title)
                                        .foregroundStyle(addSymbolForegroundStyleColor)
                                        .padding()
                                }
                            }
                        }
                        .frame(width: geometry.size.width, alignment: .leading)

                        //Distance Input View
                        VStack {
                            if viewModel.isExpandedDistance {
                                DistanceInputView(viewModel: viewModel.distanceInputViewModel)
                            }
                        }

                        
                        //MARK: Time
                        Button(action : {
                            withAnimation {
                                viewModel.isExpandedTime.toggle()
                            }
                        }) {
                            VStack {
                                if viewModel.isExpandedTime {
                                    HStack {
                                        Text("Time")
                                            .font(.title)
                                            .foregroundStyle(textForegroundeStyleColor)
                                            .padding()
                                        Spacer()
                                        Text("\(minusSymbol)")
                                            .font(.title)
                                            .foregroundStyle(minusSymbolForegroundStyleColor)
                                            .padding()
                                    }
                                } else {
                                    HStack {
                                        Text("Time")
                                            .font(.title)
                                            .foregroundStyle(textForegroundeStyleColor)
                                            .padding()
                                        Spacer()
                                        Text("\(addSymbol)")
                                            .font(.title)
                                            .foregroundStyle(addSymbolForegroundStyleColor)
                                            .padding()
                                    }
                                }
                            }
                        }
                        .frame(width: geometry.size.width, alignment: .leading)

                        //Time Input View
                        VStack {
                            if viewModel.isExpandedTime {
                                TimeInputView(viewModel: viewModel.timeInputViewModel)
                            }
                        }
                        
                        
                        //MARK: Sets
                        Button(action : {
                            withAnimation {
                                viewModel.isExpandedSets.toggle()
                            }
                        }) {
                            VStack {
                                if viewModel.isExpandedSets {
                                    HStack {
                                        Text("Sets")
                                            .font(.title)
                                            .foregroundStyle(textForegroundeStyleColor)
                                            .padding()
                                        Spacer()
                                        Text("\(minusSymbol)")
                                            .font(.title)
                                            .foregroundStyle(minusSymbolForegroundStyleColor)
                                            .padding()
                                    }
                                } else {
                                    HStack {
                                        Text("Sets")
                                            .font(.title)
                                            .foregroundStyle(textForegroundeStyleColor)
                                            .padding()
                                        Spacer()
                                        Text("\(addSymbol)")
                                            .font(.title)
                                            .foregroundStyle(addSymbolForegroundStyleColor)
                                            .padding()
                                    }
                                }                        }
                        }
                        .frame(width: geometry.size.width, alignment: .leading)

                        //Time Input View
                        VStack {
                            if viewModel.isExpandedSets {
                                SetsInputView(viewModel: viewModel.setsInputViewModel)
                            }
                        }
                        
                        //MARK: Reps
                        Button(action : {
                            withAnimation {
                                viewModel.isExpandedReps.toggle()
                            }
                        }) {
                            VStack {
                                if viewModel.isExpandedReps {
                                    HStack {
                                        Text("Reps")
                                            .font(.title)
                                            .foregroundStyle(textForegroundeStyleColor)
                                            .padding()
                                        Spacer()
                                        Text("\(minusSymbol)")
                                            .font(.title)
                                            .foregroundStyle(minusSymbolForegroundStyleColor)
                                            .padding()
                                    }
                                } else {
                                    HStack {
                                        Text("Reps")
                                            .font(.title)
                                            .foregroundStyle(textForegroundeStyleColor)
                                            .padding()
                                        Spacer()
                                        Text("\(addSymbol)")
                                            .font(.title)
                                            .foregroundStyle(addSymbolForegroundStyleColor)
                                            .padding()
                                    }
                                }
                            }
                        }
                        .frame(width: geometry.size.width, alignment: .leading)

                        //Reps Input View
                        VStack {
                            if viewModel.isExpandedReps {
                                RepsInputView(viewModel: viewModel.repsInputViewModel)
                            }
                        }
                        
                        
                        //MARK: Weight
                        Button(action : {
                            withAnimation {
                                viewModel.isExpandedWeight.toggle()
                            }
                        }) {
                            VStack {
                                if viewModel.isExpandedWeight {
                                    HStack {
                                        Text("Weight")
                                            .font(.title)
                                            .foregroundStyle(textForegroundeStyleColor)
                                            .padding()
                                        Spacer()
                                        Text("\(minusSymbol)")
                                            .font(.title)
                                            .foregroundStyle(minusSymbolForegroundStyleColor)
                                            .padding()
                                    }
                                } else {
                                    HStack {
                                        Text("Weight")
                                            .font(.title)
                                            .foregroundStyle(textForegroundeStyleColor)
                                            .padding()
                                        Spacer()
                                        Text("\(addSymbol)")
                                            .font(.title)
                                            .foregroundStyle(addSymbolForegroundStyleColor)
                                            .padding()
                                    }
                                }
                            }
                        }
                        .frame(width: geometry.size.width, alignment: .leading)

                        //Weight Input View
                        VStack {
                            if viewModel.isExpandedWeight {
                                WeightInputView(viewModel: viewModel.weightInputViewModel)
                            }
                        }
                        
                        
                        //MARK: Intensity
                        Button(action : {
                            withAnimation {
                                viewModel.isExpandedIntensity.toggle()
                            }
                        }) {
                            VStack {
                                if viewModel.isExpandedIntensity {
                                    HStack {
                                        Text("Intensity")
                                            .font(.title)
                                            .foregroundStyle(textForegroundeStyleColor)
                                            .padding()
                                        Spacer()
                                        Text("\(minusSymbol)")
                                            .font(.title)
                                            .foregroundStyle(minusSymbolForegroundStyleColor)
                                            .padding()
                                    }
                                } else {
                                    HStack {
                                        Text("Intensity")
                                            .font(.title)
                                            .foregroundStyle(textForegroundeStyleColor)
                                            .padding()
                                        Spacer()
                                        Text("\(addSymbol)")
                                            .font(.title)
                                            .foregroundStyle(addSymbolForegroundStyleColor)
                                            .padding()
                                    }
                                }
                            }
                        }
                        .frame(width: geometry.size.width, alignment: .leading)

                        //Intensity Input View
                        VStack {
                            if viewModel.isExpandedIntensity {
                                IntensityInputView(viewModel: viewModel.intensityInputViewModel)
                            }
                        }
                        
                        //MARK: Level
                        Button(action : {
                            withAnimation {
                                viewModel.isExpandedLevel.toggle()
                            }
                        }) {
                            VStack {
                                if viewModel.isExpandedLevel {
                                    HStack {
                                        Text("Level")
                                            .font(.title)
                                            .foregroundStyle(textForegroundeStyleColor)
                                            .padding()
                                        Spacer()
                                        Text("\(minusSymbol)")
                                            .font(.title)
                                            .foregroundStyle(minusSymbolForegroundStyleColor)
                                            .padding()
                                    }
                                } else {
                                    HStack {
                                        Text("Level")
                                            .font(.title)
                                            .foregroundStyle(textForegroundeStyleColor)
                                            .padding()
                                        Spacer()
                                        Text("\(addSymbol)")
                                            .font(.title)
                                            .foregroundStyle(addSymbolForegroundStyleColor)
                                            .padding()
                                    }
                                }
                            }
                        }
                        .frame(width: geometry.size.width, alignment: .leading)
                        //Level Input View
                        VStack {
                            if viewModel.isExpandedLevel {
                                LevelInputView(viewModel: viewModel.levelInputViewModel)
                            }
                        }
                    }//VStack
                    .frame(width: geometry.size.width)
                }//ScrollView
                .frame(width: geometry.size.width)
            }

            
            
        }//GeometryReader
    }
}

#Preview {
    NewExerciseModalView(viewModel: NewExerciseModalViewModel(), isModalVisible: .constant(true))
}
