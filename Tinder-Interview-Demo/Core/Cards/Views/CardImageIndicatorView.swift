//
//  CardImageIndicatorView.swift
//  Tinder-Interview-Demo
//
//  Created by Ishaan Bhasin on 3/22/24.
//

import SwiftUI

struct CardImageIndicatorView: View {
    let imageCount: Int
    let selectedIndex: Int
    var body: some View {
        HStack {
            ForEach(0 ..< imageCount, id: \.self) { val in
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundStyle(val == selectedIndex ? .white : .gray)
                        .frame(height: 3)
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.gray)
                        .frame(height: 4)
                }
            }
        }
        .padding()
    }
}

#Preview {
    CardImageIndicatorView(imageCount: 3, selectedIndex: 0)
}
