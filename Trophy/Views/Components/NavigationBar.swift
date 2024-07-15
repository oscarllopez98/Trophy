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
                            .frame(width: homeImageWidth, height: homeImageHeight)
                            .foregroundColor(activePage == .home ? .blue : .gray)
                        Text("Home")
                    }
                }
                .buttonStyle(PlainButtonStyle())
                .padding()
                Spacer()
                Button(action: {
                    activePage = .addEntry
                }) {
                    VStack {
                        Image(systemName: addEntryImageSystemName)
                            .resizable()
                            .frame(width: addEntryImageWidth, height: addEntryImageHeight)
                            .foregroundColor(activePage == .addEntry ? .blue : .gray)
                        Text("Add Entry")
                    }
                }
                .buttonStyle(PlainButtonStyle())
                .padding()
                Spacer()
                Button(action: {
                    activePage = .profile
                }) {
                    VStack {
                        Image(systemName: profileImageSystemName)
                            .resizable()
                            .frame(width: profileImageWidth, height: profileImageHeight)
                            .foregroundColor(activePage == .profile ? .blue : .gray)
                        Text("Profile")
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
