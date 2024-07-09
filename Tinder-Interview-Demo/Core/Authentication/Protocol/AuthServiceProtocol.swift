//
//  AuthServiceProtocol.swift
//  Tinder-Interview-Demo
//
//  Created by Ishaan Bhasin on 3/28/24.
//

import Foundation

protocol AuthServiceProtocol {
    func createUser(withEmail email: String, password: String) async throws -> String
    func login(withEmail email: String, password: String) async throws -> String
    func signOut()
}
