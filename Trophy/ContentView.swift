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

    @StateObject private var summaryViewModel = SummaryViewModel(userId: "userId")

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                switch activePage {
                case .home:
                    HomeView(activePage: $activePage, userId: userId, username: username)
                case .addEntry:
                    AddEntryView(viewModel: AddEntryViewModel(), summaryViewModel: summaryViewModel, activePage: $activePage, userId: userId)
                case .profile:
                    ProfileView(userId: userId, username: username, activePage: $activePage)
                case .summary:
                    SummaryView(viewModel: summaryViewModel, activePage: $activePage)
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
