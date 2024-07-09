//
//  PasswordView.swift
//  Tinder-Interview-Demo
//
//  Created by Ishaan Bhasin on 3/28/24.
//

import SwiftUI

struct PasswordView: View {
    @EnvironmentObject var authManager: AuthManager
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject private var authDataStore: AuthDataStore
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 16) {
                Text("Your password?")
                    .font(.title)
                    .fontWeight(.bold)

                Text(subtitle)

                    .font(.subheadline)
                    .foregroundStyle(.gray)

                SecureField("Enter password", text: $authDataStore.password)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                    .keyboardType(.emailAddress)
                Divider()
            }.navigationBarBackButtonHidden()

                .padding()
            Spacer()

            Button {
                onNextTapped()
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

private extension PasswordView {
    private var subtitle: String {
        guard let authType = authManager.authType else { return "" }
        switch authType {
        case .createAccount:
            return "Don't loose access to your account, add your password"
        case .login:
            return "Enter the password associated with your account to log back in"
        }
    }
    
    func onNextTapped(){
        Task {
            await authManager.authenticate(
                withEmail: authDataStore.email,
                password: authDataStore.password
            )
        }
    }
    
}

#Preview {
    PasswordView()
        .environmentObject(AuthManager(service: MockAuthService()))
        .environmentObject(AuthDataStore())
}
