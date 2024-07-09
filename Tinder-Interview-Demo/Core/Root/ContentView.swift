//
//  ContentView.swift
//  Tinder-Interview-Demo
//
//  Created by Ishaan Bhasin on 3/29/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authManger: AuthManager
    @State private var didCompleteOnboarding = false
    var body: some View {
        Group {
            switch authManger.authState {
            case .unauthenticated:
                AuthenticationRootView()
                    .environmentObject(AuthDataStore())
            case .authenticated:
//                if didCompleteOnboarding {
                    TabBarView()
//                }else {
//                    WelcomeView()
//                }
            }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(AuthManager(service: MockAuthService()))
}
