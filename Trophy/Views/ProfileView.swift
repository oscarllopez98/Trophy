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

    var body: some View {
        VStack {
            Text("User ID: \(userId)")
            Text("Username: \(username)")
            Button("Go Home") {
                activePage = .home
            }
        }
    }
}

#Preview {
    ProfileView(userId: "sampleUserId", username: "sampleUsername", activePage: .constant(.profile))
}
