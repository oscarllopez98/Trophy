//
//  ActionBarView.swift
//  Trophy
//
//  Created by Oscar Lopez on 3/11/24.
//

import SwiftUI

struct ActionBarView: View {
    
    @Binding var isModalVisible: Bool // Add binding property to track modal visibility
    
    let addSymbol: Image = Image(systemName: "plus.square")

    let controller: ActionBarViewController = ActionBarViewController()
    @State var viewModel: ActionBarViewModel = ActionBarViewModel()
    @StateObject var exerciseListViewModel: ExerciseListViewModel // Add this property

    var body: some View {
        GeometryReader { geometry in
            HStack {
                Button(action:  {
                    controller.configure(with: viewModel)
                    isModalVisible = true
                }) {
                    addSymbol
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundStyle(Color("ExerciseSymbolColor"))
                }
                .frame(width: geometry.size.height, height: geometry.size.height)
                .padding()
                .sheet(isPresented: $isModalVisible) {
                    NewExerciseModalView(viewModel: NewExerciseModalViewModel(exerciseListViewModel: exerciseListViewModel), isModalVisible: $isModalVisible)
                }
            }
            .frame(width: geometry.size.width,
                   height: geometry.size.height,
                   alignment: .center)
        }
    }
}

#Preview {
    let exerciseListViewModel = ExerciseListViewModel(userId: "dummyUserId") // Provide a dummy user ID for preview purposes
    return ActionBarView(isModalVisible: .constant(false), exerciseListViewModel: exerciseListViewModel)
}
