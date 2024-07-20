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
    
    // Dimensions
    let userProfileViewHeight: CGFloat = 0.15
    let userProfileViewWidth: CGFloat = 1
    
    let exerciseCardListAndVoiceToTextViewHeight: CGFloat = 0.75
    let exerciseCardListAndVoiceToTextViewWidth: CGFloat = 1
    
//    let exerciseCardListViewHeight: CGFloat = 0.75
//    let exerciseCardListViewWidth: CGFloat = 1
//    
    let voiceToTextViewHeight: CGFloat = 0.10
    let voiceToTextViewWidth: CGFloat = 1
    
    let navigationBarHeight: CGFloat = 0.10
    let navigationBarWidth: CGFloat = 1

    var body: some View {
        GeometryReader { geometry in
            VStack {
                HStack {
                    UserProfileInfoView()
                        .frame(width: geometry.size.width * userProfileViewWidth,
                               height: geometry.size.height * userProfileViewHeight)
                }
                
                HStack {
                    ZStack {
                        ExerciseCardListView(viewModel: ExerciseCardListViewModel(userId: userId))

                        VStack {
                            Spacer()
                            HStack {
                                Spacer()
                                VoiceToTextView()
                                    .padding(.bottom)
                            }
                            .padding(.bottom)
                            .padding(.trailing)
                        }

                    }
                    .frame(width: geometry.size.width *
                           exerciseCardListAndVoiceToTextViewWidth,
                           height: geometry.size.height *
                           exerciseCardListAndVoiceToTextViewHeight)
                }
                
                HStack {
                    NavigationBar(userId: userId, username: username, activePage: $activePage)
                        .frame(width: geometry.size.width * navigationBarWidth,
                               height: geometry.size.height * navigationBarHeight)
                }
            }
        }
    }
}

#Preview {
    HomeView(activePage: .constant(.home), userId: "sampleUserId", username: "sampleUsername")
}
