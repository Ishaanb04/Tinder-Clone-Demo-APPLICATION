//
//  EditProfileView.swift
//  Tinder-Interview-Demo
//
//  Created by Ishaan Bhasin on 3/27/24.
//

import SwiftUI

struct EditProfileView: View {
    @Environment(\.dismiss) var dismiss
    @State private var bio: String = ""
    @State private var occupation: String = ""
    let user: User
    var body: some View {
        NavigationStack {
            ScrollView {
                ProfileImageGridView(user: user)
                    .padding()

                VStack(spacing: 24) {
                    VStack(alignment: .leading) {
                        Text("ABOUT ME")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .padding(.leading)

                        TextField("Add your bio", text: $bio, axis: .vertical)
                            .padding()
                            .frame(height: 64, alignment: .top)
                            .background(Color(.secondarySystemBackground))
                            .font(.subheadline)
                    }

                    VStack(alignment: .leading) {
                        Text("Occupation".uppercased())
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .padding(.leading)

                        HStack {
                            Image(systemName: "book")
                            Text("Occupation")
                            Spacer()
                            Text(occupation)
                                .font(.footnote)
                        }
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .font(.subheadline)
                    }

                    VStack(alignment: .leading) {
                        Text("Gender".uppercased())
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .padding(.leading)

                        HStack {
                            Text("Man")
                            Spacer()
                            Image(systemName: "chevron.right")
                                .imageScale(.small)
                        }
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .font(.subheadline)
                    }

                    VStack(alignment: .leading) {
                        Text("Sexual orientation".uppercased())
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .padding(.leading)

                        HStack {
                            Text("Straight")
                            Spacer()
                            Image(systemName: "chevron.right")
                                .imageScale(.small)
                        }
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .font(.subheadline)
                    }
                }
            }
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                    .fontWeight(.semibold)
                }
            }
            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    EditProfileView(user: MockData.users[2])
}
