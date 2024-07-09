//
//  ImageScrollingOverlay.swift
//  Tinder-Interview-Demo
//
//  Created by Ishaan Bhasin on 3/22/24.
//

import SwiftUI

struct ImageScrollingOverlay: View {
    @Binding var currentImageIndex: Int
    let imageCount: Int
    var body: some View {
        HStack {
            Rectangle()
                .onTapGesture {
                    updateImageIndex(increment: false)
                }

            Rectangle()
                .onTapGesture {
                    updateImageIndex(increment: true)
                }
        }
        .foregroundStyle(.white.opacity(0.001))
    }
}

private extension ImageScrollingOverlay {
    func updateImageIndex(increment: Bool) {
        
        if increment {
            guard currentImageIndex + 1 < imageCount else {return}
            currentImageIndex += 1
        } else {
            guard currentImageIndex - 1 >= 0 else {return}
            currentImageIndex -= 1
        }
    }
}

#Preview {
    ImageScrollingOverlay(currentImageIndex: .constant(1), imageCount: 3)
}
