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
    let imageSize: CGFloat = 30 // Adjust this as needed
    
    var userId: String
    var username: String
    let borderOpacity: Double
    
    enum Page: Hashable {
        case home, addEntry, profile
    }

    @Binding var activePage: Page?

    init(userId: String, username: String, borderOpacity: Double = 1.0, activePage: Binding<Page?>) {
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
            Rectangle()
                .frame(height: 1)
                .opacity(borderOpacity)
                .foregroundColor(.black)

            HStack {
                Spacer()
                Button(action: {
                    activePage = .home
                }) {
                    VStack {
                        Image(systemName: homeImageSystemName)
                            .resizable()
                            .aspectRatio(contentMode: .fit) // Ensure the image fits without warping
                            .frame(width: imageSize, height: imageSize)
                            .foregroundColor(activePage == .home ? .blue : .gray)
                        Text("Home")
                            .font(.callout)
                            .padding(.bottom)
                            .foregroundColor(activePage == .home ? .blue : .gray)
                    }
                }
                .buttonStyle(PlainButtonStyle())
                .padding()
                
                Spacer()
                Spacer()
                
                Button(action: {
                    activePage = .addEntry
                }) {
                    VStack {
                        Image(systemName: addEntryImageSystemName)
                            .resizable()
                            .aspectRatio(contentMode: .fit) // Ensure the image fits without warping
                            .frame(width: imageSize, height: imageSize)
                            .foregroundColor(activePage == .addEntry ? .blue : .gray)
                        Text("Add Entry")
                            .font(.callout)
                            .padding(.bottom)
                            .foregroundColor(activePage == .addEntry ? .blue : .gray)
                    }
                }
                .buttonStyle(PlainButtonStyle())
                .padding()
                
                Spacer()
                Spacer()
                
                Button(action: {
                    activePage = .profile
                }) {
                    VStack {
                        Image(systemName: profileImageSystemName)
                            .resizable()
                            .aspectRatio(contentMode: .fit) // Ensure the image fits without warping
                            .frame(width: imageSize, height: imageSize)
                            .foregroundColor(activePage == .profile ? .blue : .gray)
                        Text("Profile")
                            .font(.callout)
                            .padding(.bottom)
                            .foregroundColor(activePage == .profile ? .blue : .gray)
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
    NavigationBar(userId: "sampleUserId", username: "sampleUsername", borderOpacity: 0.5, activePage: .constant(.home))
}
