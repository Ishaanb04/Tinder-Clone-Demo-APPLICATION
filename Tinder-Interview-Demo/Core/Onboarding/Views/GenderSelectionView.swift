//
//  GenderSelectionView.swift
//  Tinder-Interview-Demo
//
//  Created by Ishaan Bhasin on 4/2/24.
//

import SwiftUI

struct GenderSelectionView: View {
    @State private var selectedGender: GenderType?
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 20) {
                Text("When's your Gender?")
                    .font(.title)
                    .fontWeight(.bold)
                Text(
                    "We value and support diversity and inclusion of all genders. We will add more options to include everyone soon."
                )
                .font(
                    .subheadline
                )
            }

            ForEach(GenderType.allCases) { gender in
                Button {
                    self.selectedGender = gender
                } label: {
                    Text("\(gender.description)")
                        .foregroundStyle(Color(.primaryText))
                        .frame(width: 300, height: 50)
                        .overlay {
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(selectedGender == gender ? .red : .gray, lineWidth: 1.5)
                        }
                }
            }
            Spacer()
            NextButton()
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                BackButton()
            }
        }
        .padding()
    }
}

#Preview {
    GenderSelectionView()
}
