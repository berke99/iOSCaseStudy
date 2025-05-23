//
//  User.swift
//  iOSCaseStudy
//
//  Created by Berke Kesgin on 23.05.2025.
//

import Foundation

// MARK: - User
struct User: Codable {
    let message, token: String?
    let user: UserClass?
}

// MARK: - UserClass
struct UserClass: Codable {
    let id, name, surname, email: String?
}
