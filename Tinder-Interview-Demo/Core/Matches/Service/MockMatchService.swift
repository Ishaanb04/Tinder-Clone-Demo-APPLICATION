//
//  MockMatchService.swift
//  Tinder-Interview-Demo
//
//  Created by Ishaan Bhasin on 3/28/24.
//

import Foundation

struct MockMatchService: MatchServiceProtocol {
    func fetchMatches() async throws -> [Match] {
        return MockData.matches
    }
    
    
}
