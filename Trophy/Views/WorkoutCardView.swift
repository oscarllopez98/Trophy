//
//  WorkoutCardView.swift
//  Trophy
//
//  Created by Oscar Lopez on 3/3/24.
//

import SwiftUI

struct WorkoutCardView: View {
    
    let maxFrameWidth = CGFloat(40)
    let maxFrameHeight = CGFloat(40)
    
    let controller = WorkoutCardViewController()
    @StateObject var viewModel: WorkoutViewModel
    
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

#Preview {
    WorkoutCardView(viewModel: WorkoutViewModel.sample())
}
