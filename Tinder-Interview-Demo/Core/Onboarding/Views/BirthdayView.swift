//
//  BirthdayView.swift
//  Tinder-Interview-Demo
//
//  Created by Ishaan Bhasin on 4/2/24.
//

import SwiftUI

struct BirthdayView: View {
    @State private var birthday = Date()
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 20) {
                Text("When's your birthday?")
                    .font(.title)
                    .fontWeight(.bold)

                VStack(alignment: .leading) {
                    DatePicker("Select Date", selection: $birthday, displayedComponents: [.date])
                        .datePickerStyle(GraphicalDatePickerStyle())
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
    NavigationStack {
        BirthdayView()
    }
}
