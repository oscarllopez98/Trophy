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
        //Display
        modalViewController.modalPresentationStyle = .popover
        window.rootViewController?.present(modalViewController, animated: true, completion: nil)
    }
}


#Preview {
    let modalView = AnyView(ExerciseModalView(modalTitle: "Preview Exercise Modal"))
    let modalPresenter = ModalPresenter<AnyView>(view: modalView)
    
    return Group {
        ExerciseCardView(viewModel: ExerciseViewModel.sample())
            .onAppear() {
                modalPresenter.present()
            }
    }
}
