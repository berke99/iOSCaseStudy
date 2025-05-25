//
//  CurrentUser.swift
//  iOSCaseStudy
//
//  Created by Berke Kesgin on 25.05.2025.
//

import Foundation

struct CurrentUser: Codable {
    let id: String
    let name: String
    let surname: String
    let email: String
    let likedMovies: [String]  
    let createdAt: String
    let updatedAt: String
    let v: Int

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
        case surname
        case email
        case likedMovies
        case createdAt
        case updatedAt
        case v = "__v"
    }
}
