//
//  AuthManager.swift
//  Tinder-Interview-Demo
//
//  Created by Ishaan Bhasin on 3/28/24.
//

import FirebaseAuth
import Foundation

@MainActor
class AuthManager: ObservableObject {
    @Published var authType: AuthType?
    @Published var authState: AuthState = .unauthenticated
    private let service: AuthServiceProtocol

    init(service: AuthServiceProtocol) {
        self.service = service

        if let currentUID = Auth.auth().currentUser?.uid {
            self.authState = .authenticated(currentUID)
        }
    }

    func authenticate(withEmail email: String, password: String) async {
        guard let authType else { return }
        do { switch authType {
        case .createAccount:
            let uid = try await service.createUser(withEmail: email, password: password)
            self.authState = .authenticated(uid)
        case .login:
            let uid = try await service.login(withEmail: email, password: password)
            self.authState = .authenticated(uid)
        }
        } catch {
            self.authState = .unauthenticated
            self.authType = nil
        }
    }

    func signOut() {
        self.authState = .unauthenticated
        self.authType = nil
        self.service.signOut()
    }
}
