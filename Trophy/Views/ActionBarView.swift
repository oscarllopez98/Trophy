//
//  ActionBarView.swift
//  Trophy
//
//  Created by Oscar Lopez on 3/11/24.
//

import SwiftUI

struct ActionBarView: View {
    
    let addSymbol: Image = Image(systemName: "plus.square")
    let addSymbolForegroundStyleColor: Color = .green

    let controller: ActionBarViewController = ActionBarViewController()
    @State var viewModel: ActionBarViewModel = ActionBarViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            HStack {
                Button(action:  {
                    controller.configure(with: viewModel)
                    controller.sayHi()
                    let modalView = AnyView(NewExerciseModalView(viewModel: NewExerciseModalViewModel()))
                    let modalPresenter = ModalPresenter<NewExerciseModalView>(view: modalView)
                    modalPresenter.present()
                }) {
                    addSymbol
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundStyle(addSymbolForegroundStyleColor)
                }
                .foregroundStyle(addSymbolForegroundStyleColor)
                .frame(width: geometry.size.height, height: geometry.size.height)
                .padding()
            }
            .frame(width: geometry.size.width, 
                   height: geometry.size.height,
                   alignment: .center)
        }
    }

}

#Preview {
    ActionBarView()
}
