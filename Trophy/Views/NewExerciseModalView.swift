//
//  NewExerciseModalView.swift
//  Trophy
//
//  Created by Oscar Lopez on 3/4/24.
//

import SwiftUI

struct NewExerciseModalView: View {
    
    //State values for Custom Input Views
    @State private var newExerciseTitle: String = ""
    
    @State private var isExpandedDistance = false
    @State private var isExpandedTime = false
    @State private var isExpandedSets = false
    @State private var isExpandedReps = false
    @State private var isExpandedWeight = false
    @State private var isExpandedIntensity = false
    @State private var isExpandedLevel = false
        
    let addSymbol: Image = Image(systemName: "plus.circle")
    let minusSymbol: Image = Image(systemName: "minus.circle")
    
    let textForegroundeStyleColor: Color = .primary
    let addSymbolForegroundStyleColor: Color = .green
    let minusSymbolForegroundStyleColor: Color = .red
    
    var body: some View {
        
        GeometryReader { geometry in
            VStack {
                TextField (
                    "Enter New Exercise Title",
                    text: $newExerciseTitle
                )
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                
                ScrollView {
                    VStack {
                        //MARK: Distance
                        Button(action : {
                            withAnimation {
                                self.isExpandedDistance.toggle()
                            }
                        }) {
                            if isExpandedDistance {
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
                        .border(Color.black)

                        //Distance Input View
                        VStack {
                            if isExpandedDistance {
                                DistanceInputView()
                            }
                        }

                        
                        //MARK: Time
                        Button(action : {
                            withAnimation {
                                self.isExpandedTime.toggle()
                            }
                        }) {
                            VStack {
                                if isExpandedTime {
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
                        .border(Color.black)
                        //Time Input View
                        VStack {
                            if isExpandedTime {
                                TimeInputView()
                            }
                        }
                        
                        
                        //MARK: Sets
                        Button(action : {
                            withAnimation {
                                self.isExpandedSets.toggle()
                            }
                        }) {
                            VStack {
                                if isExpandedSets {
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
                        .border(Color.black)
                        //Time Input View
                        VStack {
                            if isExpandedSets {
                                SetsInputView()
                            }
                        }
                        
                        //MARK: Reps
                        Button(action : {
                            withAnimation {
                                self.isExpandedReps.toggle()
                            }
                        }) {
                            VStack {
                                if isExpandedReps {
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
                        .border(Color.black)
                        //Reps Input View
                        VStack {
                            if isExpandedReps {
                                RepsInputView()
                            }
                        }
                        
                        
                        //MARK: Weight
                        Button(action : {
                            withAnimation {
                                self.isExpandedWeight.toggle()
                            }
                        }) {
                            VStack {
                                if isExpandedWeight {
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
                        .border(Color.black)
                        //Weight Input View
                        VStack {
                            if isExpandedWeight {
                                WeightInputView()
                            }
                        }
                        
                        
                        //MARK: Intensity
                        Button(action : {
                            withAnimation {
                                self.isExpandedIntensity.toggle()
                            }
                        }) {
                            VStack {
                                if isExpandedIntensity {
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
                        .border(Color.black)
                        //Intensity Input View
                        VStack {
                            if isExpandedIntensity {
                                IntensityInputView()
                            }
                        }
                        
                        //MARK: Level
                        Button(action : {
                            withAnimation {
                                self.isExpandedLevel.toggle()
                            }
                        }) {
                            VStack {
                                if isExpandedLevel {
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
                        .border(Color.black)
                        //Level Input View
                        VStack {
                            if isExpandedLevel {
                                LevelInputView()
                            }
                        }
                    }//VStack
                    .frame(width: geometry.size.width)
                    .border(Color.red)
                }//ScrollView
                .frame(width: geometry.size.width)
                .border(Color.black)
            }

            
            
        }//GeometryReader
    }
}

#Preview {
    NewExerciseModalView()
}
