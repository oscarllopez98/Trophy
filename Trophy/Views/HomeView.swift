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
    let userProfileViewHeight: CGFloat = 0.20
    let userProfileViewWidth: CGFloat = 1
    
    let exerciseCardListViewHeight: CGFloat = 0.70
    let exerciseCardListViewWidth: CGFloat = 1
    
    let navigationBarHeight: CGFloat = 0.10
    let navigationBarWidth: CGFloat = 1

    var body: some View {
        GeometryReader { geometry in
            VStack {
                UserProfileInfoView()
                    .frame(width: geometry.size.width * userProfileViewWidth,
                           height: geometry.size.height * userProfileViewHeight)
                ExerciseCardListView(viewModel: ExerciseCardListViewModel(userId: userId))
                    .frame(width: geometry.size.width * exerciseCardListViewWidth,
                           height: geometry.size.height * exerciseCardListViewHeight)
                NavigationBar(userId: userId, username: username, activePage: $activePage)
                    .frame(width: geometry.size.width * navigationBarWidth,
                           height: geometry.size.height * navigationBarHeight)
            }
        }


    }
}

#Preview {
    HomeView(activePage: .constant(.home), userId: "sampleUserId", username: "sampleUsername")
}
