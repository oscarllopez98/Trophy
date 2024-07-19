//
//  ProfileView.swift
//  Trophy
//
//  Created by Oscar Lopez on 7/14/24.
//

import SwiftUI

struct ProfileView: View {
    let userId: String
    let username: String
    @Binding var activePage: NavigationBar.Page?
    @StateObject private var profileViewModel = ProfileViewModel()
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""
    
    // Dimensions
    let callToActionsRowHeight: CGFloat = 0.2
    let callToActionsRowWidth: CGFloat = 1

    let userDetailsHeight: CGFloat = 0.75
    let userDetailsWidth: CGFloat = 1

    let navigationBarHeight: CGFloat = 0.05
    let navigationBarWidth: CGFloat = 1

    var body: some View {
        GeometryReader { geometry in
            VStack {
                // Call to Actions Row
                HStack {
                    Button("Sign Out") {
                        Task {
                            await profileViewModel.signOut()
                            activePage = .home
                        }
                    }
                    .alert(isPresented: $showAlert) {
                        Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                    }

                    Button("Go Home") {
                        activePage = .home
                    }
                }
                .frame(width: geometry.size.width * callToActionsRowWidth,
                       height: geometry.size.height * callToActionsRowHeight)
                
                // User Details
                HStack {
                    Text("User ID: \n\(userId)")
                    Text("Username: \n\(username)")
                }
                .frame(width: geometry.size.width * userDetailsWidth,
                       height: geometry.size.height * userDetailsHeight)
                
                // Navigation Bar
                HStack {
                    NavigationBar(userId: userId, username: username, activePage: $activePage)
                }
                .frame(width: geometry.size.width * navigationBarWidth,
                       height: geometry.size.height * navigationBarHeight)

            }
        }
    }
}

#Preview {
    ProfileView(userId: "sampleUserId", username: "sampleUsername", activePage: .constant(.profile))
}
