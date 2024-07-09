//
//  CardService.swift
//  Tinder-Interview-Demo
//
//  Created by Ishaan Bhasin on 3/25/24.
//

import Foundation

struct CardService {
    func fetchCardModels() async throws -> [CardModel] {
        let users = MockData.users
        return users.map {CardModel(user: $0)}
    }
}
