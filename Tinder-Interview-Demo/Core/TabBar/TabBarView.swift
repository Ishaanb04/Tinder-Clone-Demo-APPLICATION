//
//  TabBarView.swift
//  Tinder-Interview-Demo
//
//  Created by Ishaan Bhasin on 3/14/24.
//

import SwiftUI

struct TabBarView: View {
    @StateObject var matchManger = MatchManager(service: MockMatchService())
    var body: some View {
        TabView {
            CardStackView()
                .tabItem { Image(systemName: "flame.fill") }
                .tag(0)

            Text("Debug: Likes Screen")
                .tabItem { Image(systemName: "star.fill") }
                .tag(1)

            InboxView()
                .tabItem { Image(systemName: "bubble.fill") }
                .tag(2)

            CurrentUserProfileView(user: MockData.users[0])
                .tabItem { Image(systemName: "person") }
                .tag(3)
        }
        .tint(.primary)
        .environmentObject(matchManger)
    }
}

#Preview {
    TabBarView()
        .environmentObject(MatchManager(service: MockMatchService()))
}
