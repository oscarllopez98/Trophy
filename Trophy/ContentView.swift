//
//  ContentView.swift
//  Trophy
//
//  Created by Oscar Lopez on 11/26/23.
//

import SwiftUI

struct ContentView: View {
    
    //TODO: Replace hardcoded Exercises
    let exercises: [Exercise] = [
        Exercise(id: UUID(),
                 name: "First Exercise",
                 type: ExerciseType.other,
                 attributes: [.level: LevelAttribute(value: .nine)],
                 date: Date(),
                 duration: nil,
                 notes: nil),
        Exercise(id: UUID(),
                 name: "Second Exercise",
                 type: ExerciseType.other,
                 attributes: [.level: LevelAttribute(value: .seven)],
                 date: Date(),
                 duration: nil,
                 notes: nil),
    ]
    
    
    var body: some View {
        
        //Our Main Container
        GeometryReader { geometry in
            VStack(spacing: 0) {
                //Navbar
                HStack {
                    Text("1")
                }
                .frame(width: geometry.size.width,
                    height: geometry.size.height * 0.05)
                .background(.red)
                
                
                //Bodybar
                HStack {
                    ScrollView {
                        
                        //Display the Exercises
                        ForEach(mapExercisesToViewModels(
                            exercises: exercises), id: \.id) { viewModel in
                            ExerciseCardView(viewModel: viewModel)
                        }
                        
                    }
                    .frame(width: geometry.size.width,
                           height: geometry.size.height * 0.89)
                    .background(.yellow)
                }
                .frame(width: geometry.size.width,
                       height: geometry.size.height * 0.90)
                .background(.blue)
                
                
                //Actionbar
                HStack {
                    Text("3")
                }
                .frame(width: geometry.size.width,
                    height: geometry.size.height * 0.05)
                .background(.green)
            }
            .frame(width: geometry.size.width,
                height: geometry.size.height)
        }
    }
}


/***
 What do we need:
    * VStack
        * Top Navbar
        * Body Content
            * Vertical Scrolling
                * VStack - For showing our components Vertically
        * Bottom Action Bar
 
 Needed Components
    * Navbar
    * BodyView
    * Action bar
    * Workout Card
    * Exercise Card
 */


let maxFrameWidth = CGFloat(40)
let maxFrameHeight = CGFloat(40)

struct WorkoutCardView: View {
    
    //TODO: Add
    let name = "Workout Name"
    let date = "February 28, 2024"
    let workoutSymbol = "W"
    
    @StateObject var controller = WorkoutCardViewController()
    
    var body: some View {
        
        Button(action: {
            controller.sayHi()
        }) {
            ZStack() {
                //Shape of Card
                GeometryReader { geometry in
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.black, lineWidth: 1)
                        .frame(width: geometry.size.width, height: 100)
                        .foregroundColor(.black)
                        .background(.white)
                }
                
                HStack {
                    VStack(alignment: .leading) {
                        Text(workoutSymbol)
                            .font(.title)
                            .foregroundStyle(.black)
                    }
                    .frame(maxWidth: maxFrameWidth, maxHeight: maxFrameHeight)
                    .background(.brown)
                    
                    Spacer()
                    
                    VStack {
                        Spacer()
                        Text(name).foregroundStyle(.black)
                        Spacer()
                        Text(date).foregroundStyle(.black)
                        Spacer()
                    }
                    
                    Spacer()
                }.padding()
            }
            .padding()
        }
    }
}

struct ExerciseCardView: View {
    
    @StateObject var controller = ExerciseCardViewController()
    let viewModel: ExerciseViewModel
    
    //TODO: Add
    let workoutSymbol = "E"
    
    var body: some View {
        
        Button(action: {
            controller.configure(with: viewModel)
            controller.sayHi()
            controller.printTestExerciseName()
        }) {
            ZStack() {
                //Shape of Card
                GeometryReader { geometry in
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.black, lineWidth: 1)
                        .frame(width: geometry.size.width, height: 100)
                        .foregroundColor(.black)
                        .background(.white)
                }
                
                //ExerciseCardView Content
                HStack {
                    
                    //Symbol for Workout
                    VStack(alignment: .leading) {
                        Text(workoutSymbol)
                            .font(.title)
                            .foregroundStyle(.black)
                    }
                    .frame(maxWidth: maxFrameWidth, maxHeight: maxFrameHeight)
                    .background(.pink)
                    
                    Spacer()
                    
                    //Name + Date
                    VStack {
                        Spacer()
                        Text(viewModel.getExerciseName())
                            .foregroundStyle(.black)
                        Spacer()
                        Text(viewModel.getExerciseDateFormatted())
                            .foregroundStyle(.black)
                        Spacer()
                    }
                    
                    Spacer()
                }.padding()
            }
            .padding()
        }
    }
}

//This helps create ExerciseCardViews based on a given list of Exercises
func mapExercisesToViewModels(exercises: [Exercise]) -> [ExerciseViewModel] {
    return exercises.map { exercise in
        return ExerciseViewModel(id: exercise.id,
                                 name: exercise.name,
                                 type: exercise.type,
                                 attributes: exercise.attributes,
                                 date: exercise.date)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


