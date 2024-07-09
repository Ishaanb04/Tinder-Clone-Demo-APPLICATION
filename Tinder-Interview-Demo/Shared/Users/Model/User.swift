//
//  User.swift
//  Tinder-Interview-Demo
//
//  Created by Ishaan Bhasin on 3/25/24.
//

import Foundation

struct User: Identifiable, Hashable, Codable {
    let id: String
    let fullName: String
    var age: Int
    var profileImageURLs: [String]
}

extension User{
    var firstName: String {
        let components = fullName.components(separatedBy: " ")
        return components[0]
    }
}
