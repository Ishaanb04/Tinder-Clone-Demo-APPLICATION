//
//  WelcomeView.swift
//  Tinder-Interview-Demo
//
//  Created by Ishaan Bhasin on 3/30/24.
//

import SwiftUI

struct WelcomeView: View {
    @StateObject var onboardingManager = OnboardingManager()
    var body: some View {
        NavigationStack(path: $onboardingManager.navigationPath) {
            VStack(spacing: 24) {
                VStack(alignment: .leading, spacing: 8) {
                    Image(.tinderLogo)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 64)

                    Text("Welcome to Tinder")
                        .font(.title)
                        .fontWeight(.bold)

                    Text("Please follow there house rules")
                        .font(.footnote)
                        .foregroundStyle(.gray)
                    WelcomeInfoItemView(title: "Be Yourself", subtitle: "Make sure your photos, age, and bio are true to who you are.")
                    WelcomeInfoItemView(title: "Stay Safe", subtitle: "Don't be too quick to give out personal information")
                    WelcomeInfoItemView(title: "Play Cool", subtitle: "Respect others and treat them as you would like to be treated")
                    WelcomeInfoItemView(title: "Be Proactive", subtitle: "Always report bad behavior")
                }
                .frame(maxWidth: .infinity, alignment: .leading)

                
                Spacer()

                Button {
                    onboardingManager.start()
                } label: {
                    Text("I agree")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(width: 350, height: 44)
                        .background(.pink)
                        .clipShape(Capsule())
                }
            }
            .navigationBarBackButtonHidden()
            .padding()
            .navigationDestination(for: OnboardingSteps.self) {
                step in
                Group {
                    
                    switch step {
                    case .name:
                        FullNameView()
                    case .birthday:
                        BirthdayView()
                    case .occupation:
                        OccupationView()
                    case .gender:
                        GenderSelectionView()
                    case .sexualOrientation:
                        SexualOrientationSelectionView()
                    case .photos:
                        AddProfilePhotosView()
                    }
                }
                .environmentObject(onboardingManager)
            }
        }
    }
}

#Preview {
    WelcomeView()
}

struct WelcomeInfoItemView: View {
    let title: String
    let subtitle: String
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .fontWeight(.semibold)
                .foregroundStyle(.primary)
            Text(subtitle)
                .foregroundStyle(.gray)
        }
    }
}
