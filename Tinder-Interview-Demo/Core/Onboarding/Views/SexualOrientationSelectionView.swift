//
//  SexualOrientationSelectionView.swift
//  Tinder-Interview-Demo
//
//  Created by Ishaan Bhasin on 4/2/24.
//

import SwiftUI

struct SexualOrientationSelectionView: View {
    @State private var sexualOrientation: SexualOrientationType?
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 20) {
                Text("What's your Sexual Orientation?")
                    .font(.title)
                    .fontWeight(.bold)

                VStack(alignment: .leading, spacing: 20) {
                    ForEach(SexualOrientationType.allCases) { orientation in
                        Button {
                            sexualOrientation = orientation
                        } label: {
                            HStack {
                                Text("\(orientation.description)")
                                Spacer()
                                if sexualOrientation == orientation {
                                    Image(systemName: "checkmark")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 14, height: 14)
                                }
                            }
                            .foregroundStyle(.primaryText)
                        }
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
    SexualOrientationSelectionView()
}
