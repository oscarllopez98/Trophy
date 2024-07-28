//
//  NavigationBar.swift
//  Trophy
//
//  Created by Oscar Lopez on 6/29/24.
//

import SwiftUI

struct NavigationBar: View {
    // Image System Names
    let homeImageSystemName: String
    let addEntryImageSystemName: String
    let profileImageSystemName: String
    
    // Image + Text sizes
    let imageSize: CGFloat = 30 // Adjust Image size as needed
    let textSize: CGFloat = 16 // Adjust Text size as needed
    
    // Colors taken from the Assets file
    let imageColor: Color = Color("PrimaryNavigationBarImageColor")
    let textColor: Color = Color("PrimaryNavigationBarTextColor")
    
    var userId: String
    var username: String
    let borderOpacity: Double
    
    // Available pages to navigate to
    enum Page: Hashable {
        case home, addEntry, profile, summary
    }

    @Binding var activePage: Page?

    init(userId: String, username: String, borderOpacity: Double = 0.2, activePage: Binding<Page?>) {
        self.userId = userId
        self.username = username
        self.borderOpacity = borderOpacity
        homeImageSystemName = "house.fill"
        addEntryImageSystemName = "plus.app"
        profileImageSystemName = "person"
        self._activePage = activePage
    }

    var body: some View {
        VStack(spacing: 0) {
            // Button Content
            HStack {
                Spacer()
                
                // Home Button
                Button(action: {
                    activePage = .home
                }) {
                    VStack {
                        Image(systemName: homeImageSystemName)
                            .resizable()
                            .aspectRatio(contentMode: .fit) // Ensure the image fits without warping
                            .frame(width: imageSize, height: imageSize)
                            .foregroundColor(activePage == .home ? imageColor : .gray)
                        Text("Home")
                            .font(.system(size: textSize, weight: .light))
                            .padding(.bottom)
                            .foregroundColor(activePage == .home ? textColor : .gray)
                    }
                }
                .buttonStyle(PlainButtonStyle())
                .padding()
                
                Spacer()
                Spacer()
                
                // Add Entry Button
                Button(action: {
                    activePage = .addEntry
                }) {
                    VStack {
                        Image(systemName: addEntryImageSystemName)
                            .resizable()
                            // Ensure the image fits without warping
                            .aspectRatio(contentMode: .fit)
                            .frame(width: imageSize, height: imageSize)
                            .foregroundColor(activePage == .addEntry ? imageColor : .gray)
                        Text("Add Entry")
                            .font(.system(size: textSize, weight: .light))
                            .padding(.bottom)
                            .foregroundColor(activePage == .addEntry ? textColor : .gray)
                    }
                }
                .buttonStyle(PlainButtonStyle())
                .padding()
                
                Spacer()
                Spacer()
                
                // Profile Button
                Button(action: {
                    activePage = .profile
                }) {
                    VStack {
                        Image(systemName: profileImageSystemName)
                            .resizable()
                            .aspectRatio(contentMode: .fit) // Ensure the image fits without warping
                            .frame(width: imageSize, height: imageSize)
                            .foregroundColor(activePage == .profile ? imageColor : .gray)
                        Text("Profile")
                            .font(.system(size: textSize, weight: .light))
                            .padding(.bottom)
                            .foregroundColor(activePage == .profile ? textColor : .gray)
                    }
                }
                .buttonStyle(PlainButtonStyle())
                .padding()
                Spacer()
            }
            .padding(.vertical)
        }
    }
}

#Preview {
    NavigationBar(userId: "sampleUserId", username: "sampleUsername", borderOpacity: 0.2, activePage: .constant(.home))
}
