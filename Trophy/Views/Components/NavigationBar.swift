//
//  NavigationBar.swift
//  Trophy
//
//  Created by Oscar Lopez on 6/29/24.
//

import SwiftUI

struct NavigationBar: View {
    // System Names
    let homeImageSystemName: String
    let addEntryImageSystemName: String
    let profileImageSystemName: String
    
    // Button Images
    let homeImage: Image
    let addEntryImage: Image
    let profileImage: Image
    
    // Button Subtitles
    let homeImageSubtitle: String
    let addEntrySubtitle: String
    let profileImageSubtitle: String
    
    init() {
        // Set: System Names
        homeImageSystemName = "house.fill"
        addEntryImageSystemName = "plus.app"
        profileImageSystemName = "person"
        
        // Set: Button Images
        homeImage = Image(systemName: homeImageSystemName)
        addEntryImage = Image(systemName: addEntryImageSystemName)
        profileImage = Image(systemName: profileImageSystemName)
        
        // Set: Button Subtitles
        homeImageSubtitle = "Home"
        addEntrySubtitle = "Add Entry"
        profileImageSubtitle = "Profile"
    }
    
    var body: some View {
        
        // Home Image Dimensions
        let homeImageWidth: CGFloat = 40
        let homeImageHeight: CGFloat = 40

        // Add Entry Image Dimensions
        let addEntryImageWidth: CGFloat = 40
        let addEntryImageHeight: CGFloat = 40

        // Profile Image Dimensions
        let profileImageWidth: CGFloat = 40
        let profileImageHeight: CGFloat = 40

        HStack {
            Spacer()
            // Home
            VStack {
                homeImage
                    .resizable()
                    .frame(width: homeImageWidth, height: homeImageHeight)
                Text(homeImageSubtitle)
            }
            .padding(.vertical)
            
            // Add Entry
            Spacer()
            Spacer()
            
            VStack {
                addEntryImage
                    .resizable()
                    .frame(width: addEntryImageWidth, height: addEntryImageHeight)
                Text(addEntrySubtitle)
            }
            .padding(.vertical)
            Spacer()
            Spacer()
            
            // Profile
            VStack {
                profileImage
                    .resizable()
                    .frame(width: profileImageWidth, height: profileImageHeight)
                Text(profileImageSubtitle)
            }
            .padding(.vertical)
            Spacer()
        }.border(Color.black)
    }
}

#Preview {
    NavigationBar()
}
