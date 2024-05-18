//
//  ContentView.swift
//  Trophy
//
//  Created by Oscar Lopez on 11/26/23.
//

import SwiftUI

struct ContentView: View {

    //Tracks the Dynamic List of Exercises
    @StateObject var exerciseListViewModel = ExerciseListViewModel()
    @State private var isModalVisible = false
    
    var body: some View {
        
        //Our Main Container
        GeometryReader { geometry in
            VStack(spacing: 0) {
                //MARK: Navbar
                HStack {
                    Text("Navbar")
                }
                .frame(width: geometry.size.width,
                    height: geometry.size.height * 0.1)
                .background(Color("PrimaryColor"))
                
                
                //MARK: Bodybar
                HStack {
                    GeometryReader { scrollGeo in
                        ScrollView {
                            //Display each ExerciseCardViews
                            ForEach(Array(exerciseListViewModel.exercises.enumerated()), id: \.element.id) { index, exercise in
                                ExerciseCardView(viewModel: ExerciseViewModel(exercise: exercise))
                                    .padding(index == 0 ? [.horizontal, .top] : .horizontal)
                            }
                            
                            //If no exercises, inform user how to add exercises
                            if exerciseListViewModel.exercises.isEmpty {
                                VStack() {
                                    Spacer()
                                    Text("You don't have any Exercises tracked yet!")
                                        .font(.headline)
                                        .foregroundStyle(Color("EmptyListTextColor"))
                                        .multilineTextAlignment(.center)
                                    Text("Click the + icon below to get started.")
                                        .font(.subheadline)
                                        .foregroundStyle(Color("EmptyListTextColor"))
                                        .multilineTextAlignment(.center)
                                    Spacer()
                                }
                                .frame(height: geometry.size.height * 0.80)
                            }
                            
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color("SecondaryColor"))
                    }
                }
                .frame(width: geometry.size.width,
                       height: geometry.size.height * 0.80)
                .background(.blue)
                
                
                //MARK: Actionbar
                GeometryReader { actionBarGeo in
                    HStack {
                        ActionBarView(isModalVisible: $isModalVisible)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                .background(Color("PrimaryColor"))
                .frame(maxWidth: .infinity)

            }//VStack
            .frame(width: geometry.size.width,
                height: geometry.size.height)
        }//GeometryReader
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}


//This helps create ExerciseCardViews based on a given list of Exercises
func mapExercisesToViewModels(exercises: [Exercise]) -> [ExerciseViewModel] {
    return exercises.map { exercise in
        return ExerciseViewModel(id: exercise.id!,
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


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


