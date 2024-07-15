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

    init(userId: String, username: String) {
        _exerciseCardListViewModel = StateObject(wrappedValue: ExerciseCardListViewModel(userId: userId))
        self.userId = userId
        self.username = username
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
                        NavigationBar(userId: userId, username: username, activePage: .constant(.home))  // Pass the userId and username
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
    HomeView(userId: "sampleUserId", username: "sampleUsername")
}
