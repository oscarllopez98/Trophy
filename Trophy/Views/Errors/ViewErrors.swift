//
//  ViewErrors.swift
//  Trophy
//
//  Created by Oscar Lopez on 7/19/24.
//

import Foundation


enum ViewErrors: Error, Equatable {
    
    // Case: UserProfileView
    case UserProfileViewFailedFetchUserId
    case UserProfileViewFailedFetchUserAttributes
    
    case UserProfileViewFailedFetchUserFullName
    case UserProfileViewFailedFetchUserFullName_EmptyValue
    
    case UserProfileViewFailedFetchUserGivenName
    case UserProfileViewFailedFetchUserGivenName_EmptyValue
    
    case UserProfileViewFailedFetchUserFamilyName
    case UserProfileViewFailedFetchUserFamilyName_EmptyValue
    
    case UserProfileViewFailedFetchUsername
    case UserProfileViewFailedFetchUserName
    case UserProfileViewFailedFetchUserEmail
    case UserProfileViewFailedFetchUserPhoneNumber
    case UserProfileViewFailedFetchUserBirthday
    
}
