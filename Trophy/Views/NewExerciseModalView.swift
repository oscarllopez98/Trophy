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
    
    //State trackers for values
    //State variables for tracking:
    @StateObject var distanceInputViewModel = DistanceInputViewModel()
    @StateObject var timeInputViewModel = TimeInputViewModel()
    @StateObject var setsInputViewModel = SetsInputViewModel()
    @StateObject var repsInputViewModel = RepsInputViewModel()
    @StateObject var weightInputViewModel = WeightInputViewModel()
    @StateObject var intensityInputViewModel = IntensityInputViewModel()
    
    @State private var selectedHours: Int = 0
    @State private var selectedMinutes: Int = 0
    @State private var selectedSeconds: Int = 0
    
    @State var selectedSets: String = ""   //Sets value
    @State var selectedReps: String = ""    //Reps value
    @State var selectedWeight: String = ""    //Weight Value
    @State var selectedWeightUnitIndex: Int = 0   //Weight Unit Value (by index)
    
    @State var selectedIntensity: String = ""    //Intensity Value
    @State var selectedIntensityUnitIndex: Int = 0   //Intensity Value (by index)
    
    @State var selectedLevelUnitIndex: Int = 0   //Level Unit Value (by index)
    
    //State trackers for expanded animation
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
    
    let submitRowHeight = CGFloat(40)
    
    var body: some View {
        
        GeometryReader { geometry in
            VStack {
                GeometryReader { row in
                    HStack {
                        TextField (
                            "Enter Exercise Title",
                            text: $newExerciseTitle
                        )
                        .frame(maxWidth: row.size.width * 0.7,
                               maxHeight: .infinity)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                        
                        Button(action: {
                            //Log all the current values where isExpanded == true
                            
                            print("Submit!")
                            
                            //Print Distance
                            print("Distance: \(distanceInputViewModel.selectedDistance)")
                            //Print Time
                            print("Time (HH:MM:SS): \(selectedHours):\(selectedMinutes):\(selectedSeconds)")
                            //Print Sets
                            print("Sets: \(selectedSets)")
                            //Print Reps
                            print("Reps: \(selectedReps)")
                            //Print Weight
                            print("Weight: \(selectedWeight)")
                            //Print Intensity
                            print("Intensity: \(selectedIntensity)")
                            //Print Level
                            print("Level Index: \(selectedLevelUnitIndex)")
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

                        //Distance Input View
                        VStack {
                            if isExpandedDistance {
                                DistanceInputView(viewModel: distanceInputViewModel)
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

                        //Time Input View
                        VStack {
                            if isExpandedTime {
                                TimeInputView(viewModel: timeInputViewModel)
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

                        //Time Input View
                        VStack {
                            if isExpandedSets {
                                SetsInputView(viewModel: setsInputViewModel)
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

                        //Reps Input View
                        VStack {
                            if isExpandedReps {
                                RepsInputView(viewModel: repsInputViewModel)
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

                        //Weight Input View
                        VStack {
                            if isExpandedWeight {
                                WeightInputView(viewModel: weightInputViewModel)
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

                        //Intensity Input View
                        VStack {
                            if isExpandedIntensity {
                                IntensityInputView(viewModel: intensityInputViewModel)
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
                        //Level Input View
                        VStack {
                            if isExpandedLevel {
                                LevelInputView(selectedLevelUnitIndex: $selectedLevelUnitIndex)
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
    NewExerciseModalView()
}
