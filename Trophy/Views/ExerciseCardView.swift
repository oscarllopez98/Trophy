//
//  ExerciseCardView.swift
//  Trophy
//
//  Created by Oscar Lopez on 3/3/24.
//

import SwiftUI

struct ExerciseCardView: View {
    
    let maxFrameWidth = CGFloat(40)
    let maxFrameHeight = CGFloat(40)
    let buttonAccessibilityIdentifier = "AID_ExerciseCardView_Button"
    
    let controller = ExerciseCardViewController()
    @StateObject var viewModel: ExerciseViewModel
    
    //TODO: Add
    let workoutSymbol = "E"
    
    var body: some View {
        
        Button(action: {
            controller.configure(with: viewModel)
            controller.printTestExerciseName()
            let modalView = AnyView(ExerciseModalView(viewModel: viewModel))
            let modalPresenter = ModalPresenter<ExerciseCardView>(view: modalView)
            modalPresenter.present()
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
        .accessibilityIdentifier(buttonAccessibilityIdentifier)
    }
}

#Preview {
    ExerciseCardView(viewModel: ExerciseViewModel.sample())
}
