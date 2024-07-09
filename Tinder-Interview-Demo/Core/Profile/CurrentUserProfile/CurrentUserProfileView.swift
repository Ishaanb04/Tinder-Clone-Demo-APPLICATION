//
//  CurrentUserProfileView.swift
//  Tinder-Interview-Demo
//
//  Created by Ishaan Bhasin on 3/26/24.
//

import SwiftUI

struct CurrentUserProfileView: View {
    @State private var isFullScreenCoverPresented = false
    @EnvironmentObject private var authManager: AuthManager
    let user: User

    var body: some View {
        NavigationStack {
            List {
                // Header View
                CurrentUserProfileHeaderView(user: user)
                    .onTapGesture {
                        isFullScreenCoverPresented.toggle()
                    }
                // Account Info View
                Section("Account Information") {
                    HStack {
                        Text("Name")
                        Spacer()
                        Text(user.fullName)
                    }

                    HStack {
                        Text("Email")
                        Spacer()
                        Text("test@gmail.com")
                    }
                }
                // Legal
                Section("Legal") {
                    Text("Terms of Service")
                }
                // Logout/ Delete
                Section {
                    Button {
                        authManager.signOut()
                    } label: {
                        Text("Logout")
                    }
                    .foregroundStyle(.red)
                }
                Section {
                    Button {} label: {
                        Text("Delete Account")
                    }
                    .foregroundStyle(.red)
                }
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .fullScreenCover(isPresented: $isFullScreenCoverPresented) {
                EditProfileView(user: user)
            }
        }
    }
}

#Preview {
    CurrentUserProfileView(user: MockData.users[1])
}
