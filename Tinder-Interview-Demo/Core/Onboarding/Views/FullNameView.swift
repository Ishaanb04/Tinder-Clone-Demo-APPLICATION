//
//  FullNameView.swift
//  Tinder-Interview-Demo
//
//  Created by Ishaan Bhasin on 3/30/24.
//

import SwiftUI

struct FullNameView: View {
    @State private var fullName = ""

    var body: some View {
        VStack(spacing: 20) {
           
            VStack(alignment: .leading) {
                Text("What's your full name?")
                    .font(.title)
                    .fontWeight(.bold)
                TextField("Enter Full Name", text: $fullName)
                Divider()
                VStack(alignment: .leading) {
                    Text("This is how it will appear in your profile.")

                        .foregroundStyle(.gray)
                    Text("Can't change it later.")

                        .fontWeight(.bold)
                }
                .padding(.top)
                .font(.footnote)
            }
            .frame(maxWidth: .infinity, alignment: .leading)

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
    NavigationStack {
        FullNameView()
    }
}
