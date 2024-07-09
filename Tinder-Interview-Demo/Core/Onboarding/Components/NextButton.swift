//
//  NextButton.swift
//  Tinder-Interview-Demo
//
//  Created by Ishaan Bhasin on 3/30/24.
//

import SwiftUI

struct NextButton: View {
    @EnvironmentObject var manager: OnboardingManager
    var body: some View {
        Button { manager.navigate() } label: {
            Text("I agree")
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
                .frame(width: 350, height: 44)
                .background(.pink)
                .clipShape(Capsule())
        }
    }
}

#Preview {
    NextButton()
}
