//
//  AuthType.swift
//  Tinder-Interview-Demo
//
//  Created by Ishaan Bhasin on 3/29/24.
//

import Foundation
enum AuthType: Int, Identifiable {
    case createAccount
    case login

    var id: Int { return rawValue }
}
