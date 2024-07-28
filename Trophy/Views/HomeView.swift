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

    @StateObject private var exerciseCardListViewModel: ExerciseCardListViewModel
    @State private var isTextBoxVisible: Bool = false
    @State private var transcribedText: String = "Example: I ran a marathon today in 3 hours, 48 minutes, and 26 seconds"

    init(activePage: Binding<NavigationBar.Page?>, userId: String, username: String) {
        self._activePage = activePage
        self.userId = userId
        self.username = username
        self._exerciseCardListViewModel = StateObject(wrappedValue: ExerciseCardListViewModel(userId: userId))
    }

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                VStack {
                    HStack {
                        UserProfileInfoView()
                            .frame(width: geometry.size.width, height: geometry.size.height * 0.15)
                    }

                    HStack {
                        ZStack {
                            ExerciseCardListView(viewModel: exerciseCardListViewModel)

                            VStack {
                                Spacer()
                                HStack {
                                    Spacer()
                                    VoiceToTextView(isTextBoxVisible: $isTextBoxVisible)
                                        .padding(.bottom)
                                }
                                .padding(.bottom)
                                .padding(.trailing)
                            }
                        }
                        .frame(width: geometry.size.width, height: geometry.size.height * 0.75)
                    }

                    HStack {
                        NavigationBar(userId: userId, username: username, activePage: $activePage)
                            .frame(width: geometry.size.width, height: geometry.size.height * 0.10)
                    }
                }
                .blur(radius: isTextBoxVisible ? 10 : 0)

                if isTextBoxVisible {
                    Color.black.opacity(0.4)
                        .ignoresSafeArea()
                        .onTapGesture {
                            isTextBoxVisible = false
                        }

                    VoiceToTextBoxView(transcribedText: $transcribedText, isTextBoxVisible: $isTextBoxVisible, activePage: $activePage, viewModel: VoiceToTextViewModel(), homeViewModel: exerciseCardListViewModel)
                        .transition(.scale)
                        .frame(width: geometry.size.width * 0.8, height: geometry.size.height * 0.65)
                        .background(Color.white)
                        .cornerRadius(15)
                        .shadow(radius: 10)
                }
            }
        }
        .onAppear {
            exerciseCardListViewModel.fetchExercisesIfNeeded()
        }
    }
}

#Preview {
    HomeView(activePage: .constant(.home), userId: "sampleUserId", username: "sampleUsername")
}
