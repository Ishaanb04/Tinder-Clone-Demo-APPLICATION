//
//  Emailview.swift
//  Tinder-Interview-Demo
//
//  Created by Ishaan Bhasin on 3/28/24.
//

import SwiftUI

struct EmailView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject private var authManger: AuthManager
    @EnvironmentObject private var authDataStore: AuthDataStore

    var body: some View {
        NavigationStack {
            VStack {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Your email?")
                        .font(.title)
                        .fontWeight(.bold)

                    Text(subtitle)

                        .font(.subheadline)
                        .foregroundStyle(.gray)

                    TextField("Enter email", text: $authDataStore.email)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                        .keyboardType(.emailAddress)
                    Divider()
                }
                .padding()

                Spacer()

                NavigationLink {
                    PasswordView()
                } label: {
                    Text("Next")
                        .foregroundStyle(.white)
                        .font(.headline)
                        .frame(width: 340, height: 50)
                        .background(.pink)
                        .clipShape(Capsule())
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button { dismiss() } label: {
                        Image(systemName: "chevron.left")
                            .imageScale(.large)
                            .fontWeight(.heavy)
                            .foregroundStyle(Color(.primaryText))
                    }
                }
            }
        }
    }
}

private extension EmailView {
    private var subtitle: String {
        guard let authType = authManger.authType else { return "" }
        switch authType {
        case .createAccount:
            return "Don't lose access to your account, add your email"
        case .login:
            return "Enter the mail associated with your account to log back in"
        }
    }
}

#Preview {
    EmailView()
        .environmentObject(AuthManager(service: MockAuthService()))
        .environmentObject(AuthDataStore())
}
