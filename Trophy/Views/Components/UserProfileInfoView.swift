//
//  UserProfileInfoView.swift
//  Trophy
//
//  Created by Oscar Lopez on 6/30/24.
//
import SwiftUI

struct UserProfileInfoView: View {
    
    @StateObject private var viewModel = UserProfileInfoViewModel()
    @State private var userFullName: String = ""
    
    // System Names
    let userProfileImageSystemName: String
    let userLocationImageSystemName: String
    
    // Displays
    let userProfileImage: Image
    let userLocationImage: Image
    let userLocation: String
    
    init() {
        // Set: System Names
        userProfileImageSystemName = "person.crop.circle"
        userLocationImageSystemName = "mappin.circle"
        
        // Set: Displays
        userProfileImage = Image(systemName: userProfileImageSystemName)
        userLocationImage = Image(systemName: userLocationImageSystemName)
        userLocation = "City, State"
    }
    
    var body: some View {
        
        // Home Image Dimensions
//        let userProfileImageWidth: CGFloat = 40
//        let userProfileImageHeight: CGFloat = 40
        
        VStack {
//            userProfileImage
//                .resizable()
//                .frame(width: userProfileImageWidth, height: userProfileImageHeight)
            Text("Welcome")
            if (!userFullName.isEmpty) {Text("\(userFullName)")}
                        
            HStack {
//                userLocationImage
//                Text(userLocation)
            }
        }
        .onAppear {
            Task {
                // Fetch user profile data on appear
                await viewModel.fetchUserProfile()
                // Update userFullName with fetched data
                userFullName = viewModel.userFullName
            }
        }
    }
}

#Preview {
    UserProfileInfoView()
}
