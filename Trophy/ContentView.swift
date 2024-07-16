//
//  ContentView.swift
//  Trophy
//
//  Created by Oscar Lopez on 7/14/24.
//

import SwiftUI

struct ContentView: View {
    @Binding var activePage: NavigationBar.Page?
    let userId: String
    let username: String

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                switch activePage {
                case .home:
                    HomeView(activePage: $activePage, userId: userId, username: username)
                case .addEntry:
                    AddEntryView(viewModel: AddEntryViewModel(), activePage: $activePage)
                case .profile:
                    ProfileView(userId: userId, username: username, activePage: $activePage)
                case .none:
                    ExerciseCardListView(viewModel: ExerciseCardListViewModel(userId: userId))
                }
            }
        }
    }
}

#Preview {
    ContentView(activePage: .constant(.home), userId: "sampleUserId", username: "sampleUsername")
}
