//
//  Match.swift
//  Tinder-Interview-Demo
//
//  Created by Ishaan Bhasin on 3/27/24.
//

import Foundation

struct Match: Codable, Identifiable, Hashable {
    let id: String
    let userId: String
    let timestamp: Date
    
    var user: User?
}
