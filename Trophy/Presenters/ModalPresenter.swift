//
//  ModalPresenter.swift
//  Trophy
//
//  Created by Oscar Lopez on 3/3/24.
//

import SwiftUI

struct ModalPresenter<T: View> {
    let view: AnyView
    
    func present() {
        
        //Check is there's a window available to display our Modal
        guard let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = scene.windows.first else {
            return
        }
        
        //Controller for dispalying SwiftUI views that are within UIKit
        let modalViewController = UIHostingController(rootView: view)
        //Display content but still see background content a little
        modalViewController.modalPresentationStyle = .popover
        window.rootViewController?.present(modalViewController, animated: true, completion: nil)
    }
}

//Sample Preview of a Modal
#Preview {
    let modalView = AnyView(ExerciseModalView(viewModel: ExerciseViewModel.sample()))
    let modalPresenter = ModalPresenter<AnyView>(view: modalView)
    
    return Group {
        ExerciseCardView(viewModel: ExerciseViewModel.sample())
            .onAppear() {
                modalPresenter.present()
            }
    }
}
