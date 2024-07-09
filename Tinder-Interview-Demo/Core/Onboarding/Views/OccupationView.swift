//
//  OccupationView.swift
//  Tinder-Interview-Demo
//
//  Created by Ishaan Bhasin on 4/2/24.
//

import SwiftUI

struct OccupationView: View {
    @State private var occupation = ""
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("What's your Occupation?")
                .font(.title)
                .fontWeight(.bold)
            VStack(alignment: .leading) {
                TextField("Enter your occupation", text: $occupation)
                Divider()
                VStack(alignment: .leading) {
                    Text("This is how it will appear in your profile.")

                        .foregroundStyle(.gray)
                    Text("You can modify it later.")

                        .fontWeight(.bold)
                }
                .padding(.top)
                .font(.footnote)
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
    OccupationView()
}
