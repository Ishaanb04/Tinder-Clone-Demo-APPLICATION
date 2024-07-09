//
//  MatchManager.swift
//  Tinder-Interview-Demo
//
//  Created by Ishaan Bhasin on 3/27/24.
//

import Foundation

@MainActor
class MatchManager: ObservableObject {
    @Published var matcheduser: User?
    @Published var matches = [Match]()
    private let service: MatchServiceProtocol

    init(service: MatchServiceProtocol) {
        self.service = service
    }

    func fetchMatches() async {
        do {
            matches = try await service.fetchMatches()
        } catch {
            print("Debug: failed to fetch matches")
        }
    }

    func checkForMatch(withUser user: User) {
        let didMatch = Bool.random()
        if didMatch {
            matcheduser = user
        }
    }
}
