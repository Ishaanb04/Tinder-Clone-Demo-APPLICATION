//
//  AuthDataStore.swift
//  Tinder-Interview-Demo
//
//  Created by Ishaan Bhasin on 3/29/24.
//

import Foundation


class AuthDataStore: ObservableObject {
    @Published var email = ""
    @Published var password = ""
}
