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

    var body: some View {
        VStack {
            Text("User ID: \(userId)")
            Text("Username: \(username)")

            Button("Sign Out") {
                Task {
                    await profileViewModel.signOut()
                }
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }

            Button("Go Home") {
                activePage = .home
            }
        }
    }
}

#Preview {
    ProfileView(userId: "sampleUserId", username: "sampleUsername", activePage: .constant(.profile))
}
