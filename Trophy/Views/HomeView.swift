//
//  HomeView.swift
//  Trophy
//
//  Created by Oscar Lopez on 7/14/24.
//

import SwiftUI

struct HomeView: View {
    @Binding var activePage: NavigationBar.Page?
    let userId: String
    let username: String

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                switch activePage {
                case .home:
                    UserProfileInfoView()
                    ExerciseCardListView(viewModel: ExerciseCardListViewModel(userId: userId))
                case .addEntry:
                    AddEntryView(viewModel: AddEntryViewModel(), activePage: $activePage)
                case .profile:
                    ProfileView(userId: userId, username: username, activePage: $activePage)
                case .none:
                    ExerciseCardListView(viewModel: ExerciseCardListViewModel(userId: userId))
                }
                
                NavigationBar(userId: userId, username: username, activePage: $activePage)
            }
        }
    }
}

#Preview {
    HomeView(activePage: .constant(.home), userId: "sampleUserId", username: "sampleUsername")
}
