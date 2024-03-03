//
//  ModalPresenter.swift
//  Trophy
//
//  Created by Oscar Lopez on 3/3/24.
//

import SwiftUI

struct ModalPresenter {
    let view: AnyView
    
    func present() {
        guard let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = scene.windows.first else {
            return
        }
        
        let modalViewController = UIHostingController(rootView: view)
        modalViewController.modalPresentationStyle = .overFullScreen
        window.rootViewController?.present(modalViewController, animated: true, completion: nil)
    }
}


#Preview {
    let modalView = ExerciseModalView(modalTitle: "Preview Exercise Modal")
    let modalPresenter = ModalPresenter(view: AnyView(modalView))
    return Group {
        ExerciseCardView(viewModel: ExerciseViewModel.sample())
            .onAppear() {
                modalPresenter.present()
            }
    }
}
