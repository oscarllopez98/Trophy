//
//  HomeView.swift
//  Trophy
//
//  Created by Oscar Lopez on 7/14/24.
//

import SwiftUI

struct HomeView: View {
    @StateObject var exerciseCardListViewModel: ExerciseCardListViewModel
    var userId: String
    var username: String
    @Binding var activePage: NavigationBar.Page  // Binding for active page

    init(userId: String, username: String, activePage: Binding<NavigationBar.Page>) {
        _exerciseCardListViewModel = StateObject(wrappedValue: ExerciseCardListViewModel(userId: userId))
        self.userId = userId
        self.username = username
        self._activePage = activePage
    }

    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                HStack {
                    Text("Navbar")
                }
                .frame(width: geometry.size.width, height: geometry.size.height * 0.1)
                
                HStack {
                    ExerciseCardListView(viewModel: exerciseCardListViewModel)
                }
                .frame(width: geometry.size.width, height: geometry.size.height * 0.80)
                
                GeometryReader { actionBarGeo in
                    HStack {
                        NavigationBar(userId: userId, username: username, activePage: $activePage)  // Pass the binding to activePage
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                .frame(maxWidth: .infinity)
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
        }
        .alert(item: $exerciseCardListViewModel.errorMessage) { error in
            Alert(title: Text("Error"), message: Text(error.message), dismissButton: .default(Text("OK")))
        }
    }
}

#Preview {
    HomeView(userId: "sampleUserId", username: "sampleUsername", activePage: .constant(.home))
}
