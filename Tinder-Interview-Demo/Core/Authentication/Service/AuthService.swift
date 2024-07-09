//
//  AuthService.swift
//  Tinder-Interview-Demo
//
//  Created by Ishaan Bhasin on 3/28/24.
//

import FirebaseAuth
import Foundation

struct AuthService: AuthServiceProtocol {
    func createUser(withEmail email: String, password: String) async throws -> String {
        let result = try await Auth.auth().createUser(withEmail: email, password: password)
        return result.user.uid
    }

    func login(withEmail email: String, password: String) async throws -> String {
        let result = try await Auth.auth().signIn(withEmail: email, password: password)
        return result.user.uid
    }

    func signOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print("Debug: Failed to signout")
        }
    }
}
