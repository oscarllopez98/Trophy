//
//  NavigationBar.swift
//  Trophy
//
//  Created by Oscar Lopez on 6/29/24.
//

import SwiftUI

struct NavigationBar: View {
    let homeImageSystemName: String
    let addEntryImageSystemName: String
    let profileImageSystemName: String
    let homeImageWidth: CGFloat = 40
    let homeImageHeight: CGFloat = 40
    let addEntryImageWidth: CGFloat = 40
    let addEntryImageHeight: CGFloat = 40
    let profileImageWidth: CGFloat = 40
    let profileImageHeight: CGFloat = 40

    var userId: String
    var username: String
    let borderOpacity: Double

    // Enum to represent the current active page
    enum Page {
        case home, addEntry, profile
    }

    @Binding var activePage: Page  // Bind the active page from a parent view

    init(userId: String, username: String, borderOpacity: Double = 1.0, activePage: Binding<Page>) {  // Default opacity to 1.0
        self.userId = userId
        self.username = username
        self.borderOpacity = borderOpacity
        homeImageSystemName = "house.fill"
        addEntryImageSystemName = "plus.app"
        profileImageSystemName = "person"
        self._activePage = activePage
    }

    var body: some View {
        VStack(spacing: 0) {  // Use VStack to add the border at the top
            Rectangle()
                .frame(height: 1)  // Height of the border
                .opacity(borderOpacity)  // Adjust transparency here
                .foregroundColor(.black)  // Color of the border

            HStack {
                Spacer()
                NavigationLink(destination: HomeView(userId: userId, username: username)) {  // Pass userId and username
                    VStack {
                        Image(systemName: homeImageSystemName)
                            .resizable()
                            .frame(width: homeImageWidth, height: homeImageHeight)
                            .foregroundStyle(activePage == .home ? .black : .gray)  // Change color based on active page
                        Text("Home")
                    }
                }
                .isDetailLink(false)
                .onTapGesture {
                    activePage = .home
                }
                Spacer()
                NavigationLink(destination: Text("Add Entry View")) {  // Replace with actual destination view
                    VStack {
                        Image(systemName: addEntryImageSystemName)
                            .resizable()
                            .frame(width: addEntryImageWidth, height: addEntryImageHeight)
                            .foregroundStyle(activePage == .addEntry ? .black : .gray)  // Change color based on active page
                        Text("Add Entry")
                    }
                }
                .isDetailLink(false)
                .onTapGesture {
                    activePage = .addEntry
                }
                Spacer()
                NavigationLink(destination: Text("Profile View")) {  // Replace with actual destination view
                    VStack {
                        Image(systemName: profileImageSystemName)
                            .resizable()
                            .frame(width: profileImageWidth, height: profileImageHeight)
                            .foregroundStyle(activePage == .profile ? .black : .gray)  // Change color based on active page
                        Text("Profile")
                    }
                }
                .isDetailLink(false)
                .onTapGesture {
                    activePage = .profile
                }
                Spacer()
            }
            .padding(.vertical)
        }
    }
}

#Preview {
    NavigationBar(userId: "sampleUserId", username: "sampleUsername", borderOpacity: 0.5, activePage: .constant(.home))
}
