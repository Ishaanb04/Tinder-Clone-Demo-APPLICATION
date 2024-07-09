//
//  SizeConstants.swift
//  Tinder-Interview-Demo
//
//  Created by Ishaan Bhasin on 3/21/24.
//

import SwiftUI

struct SizeConstants {
    static var cardWidth: CGFloat {
        UIScreen.main.bounds.width - 20
    }

    static var cardHeight: CGFloat {
        UIScreen.main.bounds.height / 1.45
    }

    static var screenCutOff: CGFloat {
        (UIScreen.main.bounds.width / 2) * 0.8
    }
}
