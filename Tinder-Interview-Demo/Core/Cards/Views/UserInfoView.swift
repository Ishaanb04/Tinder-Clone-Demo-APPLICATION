//
//  UserInfoView.swift
//  Tinder-Interview-Demo
//
//  Created by Ishaan Bhasin on 3/14/24.
//

import SwiftUI

struct UserInfoView: View {
    @Binding var showProfileModel: Bool
    let user: User

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(user.fullName)
                    .font(.title)
                    .fontWeight(.heavy)
                Text("\(user.age)")
                    .font(/*@START_MENU_TOKEN@*/ .title/*@END_MENU_TOKEN@*/)
                    .fontWeight(.semibold)

                Spacer()

                Button {
                    showProfileModel.toggle()
                } label: {
                    Image(systemName: "arrow.up.circle")
                        .fontWeight(.bold)
                        .imageScale(.large)
                }
            }

            Text("Test: Some mock bio")
                .font(.subheadline)
                .lineLimit(2)
        }
        .foregroundStyle(.white)
        .padding()
        .background(
            LinearGradient(colors: [.clear, .black], startPoint: .top, endPoint: .bottom)
        )
    }
}

#Preview {
    UserInfoView(showProfileModel: .constant(false), user: MockData.users[1])
}
