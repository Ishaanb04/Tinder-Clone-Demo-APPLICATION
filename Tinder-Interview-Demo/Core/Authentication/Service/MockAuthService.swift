//
//  MockAuthService.swift
//  Tinder-Interview-Demo
//
//  Created by Ishaan Bhasin on 3/28/24.
//

import Foundation

struct MockAuthService: AuthServiceProtocol {
    func createUser(withEmail email: String, password: String) async throws -> String {
        return NSUUID().uuidString
    }

    func login(withEmail email: String, password: String) async throws -> String {
        return NSUUID().uuidString
    }

    func signOut() {}
}
