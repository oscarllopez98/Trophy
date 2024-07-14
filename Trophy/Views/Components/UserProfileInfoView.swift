//
//  UserProfileInfoView.swift
//  Trophy
//
//  Created by Oscar Lopez on 6/30/24.
//

import SwiftUI

struct UserProfileInfoView: View {
    
    // System Names
    let userProfileImageSystemName: String
    let userLocationImageSystemName: String
    
    // Displays
    let userProfileImage: Image
    let userFullName: String
    let userLocationImage: Image
    let userLocation: String
    
    init() {
        // Set: System Names
        userProfileImageSystemName = "person.crop.circle"
        userLocationImageSystemName = "mappin.circle"
        
        // Set: Displays
        userProfileImage = Image(systemName: userProfileImageSystemName)
        userLocationImage = Image(systemName: userLocationImageSystemName)
        userFullName = "Firstname Lastname"
        userLocation = "City, State"
    }
    var body: some View {
        
        // Home Image Dimensions
        let userProfileImageWidth: CGFloat = 40
        let userProfileImageHeight: CGFloat = 40
        
        VStack {
            userProfileImage
                .resizable()
                .frame(width: userProfileImageWidth, height: userProfileImageHeight)
            Text(userFullName)
            HStack {
                userLocationImage
                Text(userLocation)
            }
        }
    }
}

#Preview {
    UserProfileInfoView()
}
