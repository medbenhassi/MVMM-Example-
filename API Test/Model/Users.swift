//
//  Users.swift
//  API Test
//
//  Created by med on 12/8/2022.
//

import Foundation

// MARK: - User
struct User: Codable {
    let id: Int
    let name, email: String
    let gender: Gender
    let status: Status
}

enum Gender: String, Codable {
    case female = "female"
    case male = "male"
}

enum Status: String, Codable {
    case active = "active"
    case inactive = "inactive"
}

typealias Users = [User]

