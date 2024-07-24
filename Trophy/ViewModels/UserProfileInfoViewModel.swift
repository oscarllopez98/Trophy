//
//  UserProfileInfoViewModel.swift
//  Trophy
//
//  Created by Oscar Lopez on 7/19/24.
//

import Foundation
import Amplify

class UserProfileInfoViewModel: ObservableObject {
    @Published var userName: String = ""
    @Published var userEmail: String = ""
    @Published var userPhoneNumber: String = ""
    @Published var userBirthday: String = ""
    @Published var userFullName: String = ""
    
    enum ViewErrors: Error {
        case userProfileViewFailedFetchUserId
        case userProfileViewFailedFetchUserAttributes
        case userProfileViewFailedFetchUserName
        case userProfileViewFailedFetchUserEmail
        case userProfileViewFailedFetchUserPhoneNumber
        case userProfileViewFailedFetchUserBirthday
    }
    
    func fetchUserProfile() async {
        do {
            let userId = try await fetchUserID()
            userName = userId // You can update this with actual name fetching logic
            userEmail = try await fetchUserEmail()
            userPhoneNumber = try await fetchUserPhoneNumber()
            userBirthday = try await fetchUserBirthday()
            userFullName = try await fetchUserFullName()
        } catch {
            print("Failed to fetch user profile: \(error)")
        }
    }
    
    private func fetchUserID() async throws -> String {
        do {
            return try await Amplify.Auth.getCurrentUser().userId
        } catch {
            throw ViewErrors.userProfileViewFailedFetchUserId
        }
    }
    
    private func fetchUserFullName() async throws -> String {
        try await fetchUserAttribute(for: .name)
    }
    
    private func fetchUserEmail() async throws -> String {
        try await fetchUserAttribute(for: .email)
    }
    
    private func fetchUserPhoneNumber() async throws -> String {
        try await fetchUserAttribute(for: .phoneNumber)
    }
    
    private func fetchUserBirthday() async throws -> String {
        try await fetchUserAttribute(for: .birthDate)
    }
    
    private func fetchUserAttribute(for key: AuthUserAttributeKey) async throws -> String {
        do {
            let userAttributes: [AuthUserAttribute] = try await Amplify.Auth.fetchUserAttributes()
            if let attributeValue = userAttributes.first(where: { $0.key == key })?.value {
                return attributeValue
            } else {
                throw ViewErrors.userProfileViewFailedFetchUserAttributes
            }
        } catch {
            throw ViewErrors.userProfileViewFailedFetchUserAttributes
        }
    }
}
