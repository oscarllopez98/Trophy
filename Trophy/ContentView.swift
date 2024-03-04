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

struct ExerciseCardModalView: View {
    var body: some View {
        VStack {
            Text("Exercise Modal!")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


