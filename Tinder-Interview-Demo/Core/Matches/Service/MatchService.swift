//
//  MatchService.swift
//  Tinder-Interview-Demo
//
//  Created by Ishaan Bhasin on 3/28/24.
//

import Foundation

protocol MatchServiceProtocol {
    func fetchMatches() async throws -> [Match]
}

struct MatchService: MatchServiceProtocol {
    func fetchMatches() async throws -> [Match] {
        // Fetch matches from firebase here
        return []
    }
}
