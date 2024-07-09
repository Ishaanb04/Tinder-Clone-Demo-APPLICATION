//
//  SwipeActionButton.swift
//  Tinder-Interview-Demo
//
//  Created by Ishaan Bhasin on 3/26/24.
//

import SwiftUI

struct SwipeActionButton: View {
    let foregroundColor: Color
    let imageName: String
    var body: some View {
        Image(systemName: imageName)
            .fontWeight(.heavy)
            .foregroundStyle(foregroundColor)
            .background(
                Circle()
                    .fill(.white)
                    .frame(width: 48, height: 48)
                    .shadow(radius: 6)
            )
    }
}

#Preview {
    SwipeActionButton(foregroundColor: .red, imageName: "xmark")
}
