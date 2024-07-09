//
//  GenderType.swift
//  Tinder-Interview-Demo
//
//  Created by Ishaan Bhasin on 4/2/24.
//

import Foundation

enum GenderType: Int, Codable, CaseIterable {
    case man
    case woman
}

extension GenderType: Identifiable {
    var id: Int { return self.rawValue }
}

extension GenderType: CustomStringConvertible {
    var description: String {
        switch self { case .man:
            return "Man"
        case .woman:
            return "Woman"
        }
    }
}
