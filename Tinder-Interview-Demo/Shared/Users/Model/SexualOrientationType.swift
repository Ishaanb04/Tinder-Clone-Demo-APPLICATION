//
//  SexualOrientationType.swift
//  Tinder-Interview-Demo
//
//  Created by Ishaan Bhasin on 4/2/24.
//

import Foundation

enum SexualOrientationType: Int, CaseIterable, Codable {
    case straight
    case gay
    case lesbian
    case asexual
    case bisexual
    case demisexual
    case pansexual
    case queer
    case questioning
}

extension SexualOrientationType: Identifiable {
    var id: Int {
        return self.rawValue
    }
}

extension SexualOrientationType: CustomStringConvertible {
    var description: String {
        switch self {
        case .straight:
            return "Striaght"
        case .gay:
            return "Gay"
        case .lesbian:
            return "Lesbian"
        case .asexual:
            return "Asexual"
        case .bisexual:
            return "Bisexual"
        case .demisexual:
            return "Demisexual"
        case .pansexual:
            return "Pansexual"
        case .queer:
            return "Queer"
        case .questioning:
            return "Questioning"
        }
    }
}
