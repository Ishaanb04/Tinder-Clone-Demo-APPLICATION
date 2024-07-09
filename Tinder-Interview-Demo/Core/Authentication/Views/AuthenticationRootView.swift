//
//  AuthenticationRootView.swift
//  Tinder-Interview-Demo
//
//  Created by Ishaan Bhasin on 3/28/24.
//

import SwiftUI

struct AuthenticationRootView: View {
    @EnvironmentObject var authManger: AuthManager
    @State private var showAuthFlow = false
    var body: some View {
        NavigationStack {
            VStack {
                Image(.tinderLogoWhite)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 40)

                VStack(spacing: 8) {
                    Text("It Starts ").bold() +
                        Text("with")
                    Text("a ") +
                        Text("Swipe").bold()
                }
                .font(.largeTitle)
                .foregroundStyle(.white)

                Spacer()

                VStack(spacing: 20) {
                    Text("By tapping 'Sign in' you agree to our Terms. Learn how we process your data in our Privacy Policy and Cookies Policy")
                        .multilineTextAlignment(.center)
                        .font(.footnote)
                        .foregroundStyle(.white
                        )
                    Button {
                        showAuthFlow.toggle()
                        authManger.authType = .createAccount
                    } label: {
                        Text("Create Account")
                            .font(.headline)
                            .foregroundStyle(.black)
                            .frame(width: 340, height: 50)
                            .background(.white)
                            .clipShape(Capsule())
                    }
                    Button {
                        showAuthFlow.toggle()
                        authManger.authType = .login
                    } label: {
                        Text("Sign In")
                            .font(.headline)
                            .foregroundStyle(.white)
                            .frame(width: 340, height: 50)
                    }
                    .overlay {
                        Capsule()
                            .stroke(.white, lineWidth: 1.5)
                    }

                    NavigationLink {
                        Text("Forgot Password")
                    } label: {
                        Text("Trouble signing in?")
                            .font(.headline)
                            .foregroundStyle(.white)
                    }
                }
            }
            .fullScreenCover(item: $authManger.authType){ type in
                EmailView()
            }
            .frame(maxWidth: .infinity)
            .background(gradientBackGround)
        }
    }
}

private extension AuthenticationRootView {
    var gradientBackGround: LinearGradient {
        LinearGradient(colors: [Color(.systemPink),
                                .pink,
                                .purple],
                       startPoint: .topTrailing, endPoint: .bottomLeading)
    }
}

#Preview {
    AuthenticationRootView()
        .environmentObject(AuthManager(service: MockAuthService()))
}
