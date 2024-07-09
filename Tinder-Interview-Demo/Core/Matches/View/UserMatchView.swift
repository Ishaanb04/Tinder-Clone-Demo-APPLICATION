//
//  UserMatchView.swift
//  Tinder-Interview-Demo
//
//  Created by Ishaan Bhasin on 3/27/24.
//

import SwiftUI

struct UserMatchView: View {
    @Binding var show: Bool
    @EnvironmentObject var matchManager: MatchManager

    var body: some View {
        ZStack {
            Rectangle()
                .fill(.black.opacity(0.7))
                .ignoresSafeArea()

            VStack(spacing: 120) {
                VStack {
                    Image(.itsamatch)
                    if let matcheduser = matchManager.matcheduser {
                        Text("You and \(matcheduser.fullName) have liked each other")
                            .foregroundStyle(.white)
                    }
                }
                HStack(spacing: 16) {
                    Image(MockData.users[2].profileImageURLs[0])
                        .resizable()
                        .scaledToFill()
                        .frame(width: 150, height: 150)
                        .clipShape(Circle())
                        .overlay {
                            Circle()
                                .stroke(.white, lineWidth: 2)
                                .shadow(radius: 4)
                        }
                    if let matcheduser = matchManager.matcheduser {
                        Image(matcheduser.profileImageURLs[0])
                            .resizable()
                            .scaledToFill()
                            .frame(width: 150, height: 150)
                            .clipShape(Circle())
                            .overlay {
                                Circle()
                                    .stroke(.white, lineWidth: 2)
                                    .shadow(radius: 4)
                            }
                    }
                }

                VStack(spacing: 16) {
                    Button { show.toggle() } label: {
                        Text("Send Message")
                    }
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(width: 350, height: 44)
                    .background(.pink
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 10))

                    Button { show.toggle() } label: { Text("Keep Swiping") }
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(width: 350, height: 44)
                        .background(.clear
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.white, lineWidth: 2)
                                .shadow(radius: 4)
                        }
                }
            }
        }
    }
}

#Preview {
    UserMatchView(show: .constant(true))
        .environmentObject(MatchManager(service: MockMatchService()))
}
