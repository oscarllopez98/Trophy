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
    
    let workouts: [Workout] = [
        Workout(id: UUID(),
                name: "First Workout",
                exercises: [
                    Exercise(id: UUID(),
                             name: "First Workout Exercise",
                             type: ExerciseType.other,
                             attributes: [.level: LevelAttribute(value: .nine)],
                             date: Date(),
                             duration: nil,
                             notes: nil),
                    Exercise(id: UUID(),
                             name: "Second Workout Exercise",
                             type: ExerciseType.other,
                             attributes: [.level: LevelAttribute(value: .seven)],
                             date: Date(),
                             duration: nil,
                             notes: nil),
                ],
                date: Date())
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
                        
                        //TODO: Dispaly Workouts and Exercises
                        
                        //Display the Exercises
                        ForEach(mapExercisesToViewModels(exercises: exercises), id: \.id) { viewModel in
                            ExerciseCardView(viewModel: viewModel)
                        }
                        
                        //Display the Workouts
                        ForEach(mapWorkoutsToViewModels(workouts: workouts),
                                id: \.id) { viewModel in
                            WorkoutCardView(viewModel: viewModel)
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


//This helps create ExerciseCardViews based on a given list of Exercises
func mapExercisesToViewModels(exercises: [Exercise]) -> [ExerciseViewModel] {
    return exercises.map { exercise in
        return ExerciseViewModel(id: exercise.id,
                                 name: exercise.name,
                                 type: exercise.type,
                                 attributes: exercise.attributes,
                                 date: exercise.date,
                                 duration: exercise.duration,
                                 notes: exercise.notes)
    }
}

//This helps create ExerciseCardViews based on a given list of Exercises
func mapWorkoutsToViewModels(workouts: [Workout]) -> [WorkoutViewModel] {
    return workouts.map { workout in
        return WorkoutViewModel(id: workout.id,
                                name: workout.name,
                                exercises: workout.exercises,
                                date: workout.date,
                                duration: workout.duration,
                                notes: workout.notes)
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
    
    @StateObject var controller = WorkoutCardViewController()
    let viewModel: WorkoutViewModel
    
    //TODO: Add
    let workoutSymbol = "W"
    
    var body: some View {
        
        Button(action: {
            controller.configure(with: viewModel)
            controller.sayHi()
            controller.printTestWorkoutName()
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
                    .background(.brown)
                    
                    Spacer()
                    
                    //Name + Date
                    VStack {
                        Spacer()
                        Text(viewModel.getName())
                            .foregroundStyle(.black)
                        Spacer()
                        Text(viewModel.getDateFormatted())
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
                        Text(viewModel.getName())
                            .foregroundStyle(.black)
                        Spacer()
                        Text(viewModel.getDateFormatted())
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




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


