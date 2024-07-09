//
//  CardModel.swift
//  Tinder-Interview-Demo
//
//  Created by Ishaan Bhasin on 3/25/24.
//

import Foundation

struct CardModel: Identifiable, Hashable {
    let user: User
}

extension CardModel {
    var id: String { return user.id }
}
