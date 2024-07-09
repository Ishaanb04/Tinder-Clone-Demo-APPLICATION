//
//  SwipeActionIndicatorView.swift
//  Tinder-Interview-Demo
//
//  Created by Ishaan Bhasin on 3/20/24.
//

import SwiftUI

struct SwipeActionIndicatorView: View {
    
    @Binding var xOffSet: CGFloat
    var body: some View {
        HStack {
            Text("LIKE")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundStyle(.green)
                .overlay {
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(.green, lineWidth: 2)
                        .frame(width: 100, height: 48)
                }
                .rotationEffect(.degrees(-45))
                .opacity(Double(xOffSet / SizeConstants.screenCutOff))
            Spacer()
            Text("NOPE")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundStyle(.red)
                .overlay {
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(.red, lineWidth: 2)
                        .frame(width: 100, height: 48)
                }
                .rotationEffect(.degrees(45))
                .opacity(Double(xOffSet / SizeConstants.screenCutOff) * -1)
        }
        .padding(40)
    }
}

#Preview {
    SwipeActionIndicatorView(xOffSet: .constant(20))
}
