//
//  BackButton.swift
//  Tinder-Interview-Demo
//
//  Created by Ishaan Bhasin on 3/30/24.
//

import SwiftUI

struct BackButton: View {
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        Button {
            dismiss()
        } label: {
            Image(systemName: "chevron.left")
                .imageScale(.large)
                .fontWeight(.heavy)
                .foregroundStyle(Color(.primaryText))
        }
    }
}

#Preview {
    BackButton()
}
