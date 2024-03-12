//
//  ExerciseCardView.swift
//  Trophy
//
//  Created by Oscar Lopez on 3/3/24.
//

import SwiftUI

struct ExerciseCardView: View {
    
    let maxFrameWidth = CGFloat(30)
    let maxFrameHeight = CGFloat(30)
    let cardHeight: CGFloat = CGFloat(80)
    
    let buttonAccessibilityIdentifier = "AID_ExerciseCardView_Button"
    
    let controller = ExerciseCardViewController()
    @StateObject var viewModel: ExerciseViewModel
    
    //TODO: Add
    let workoutSymbol = "E"
    
    var body: some View {
        HStack {
            Button(action: {
                controller.configure(with: viewModel)
                controller.printTestExerciseName()
                let modalView = AnyView(ExerciseModalView(viewModel: viewModel))
                let modalPresenter = ModalPresenter<ExerciseCardView>(view: modalView)
                modalPresenter.present()
            }) {
                ZStack(alignment: .center) {
                    //Shape of Card
                    GeometryReader { geometry in
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.black, lineWidth: 1)
                            .frame(height: cardHeight)
                            .foregroundColor(.white)
                            .background(.white)
                    }
                    
                    //ExerciseCardView Content
                    HStack(alignment: .center, spacing: 0) {
                        
                        //Symbol for Workout
                        VStack(alignment: .center) {
                            Text(workoutSymbol)
                                .font(.title)
                                .foregroundStyle(.black)
                        }
                        .frame(width: maxFrameWidth, height: maxFrameHeight)
                        .background(.pink)
                        .padding(.horizontal)
                        
                        //Name + Date
                        VStack {
                            Text(viewModel.getName())
                                .foregroundStyle(.black)
                            Text(viewModel.getDateFormatted())
                                .foregroundStyle(.black)
                        }
                        .frame(maxWidth: .infinity, maxHeight: cardHeight)
                    }
                }            
            }
            .frame(width: .infinity, height: cardHeight)
            .accessibilityIdentifier(buttonAccessibilityIdentifier)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    ExerciseCardView(viewModel: ExerciseViewModel.sample())
}
