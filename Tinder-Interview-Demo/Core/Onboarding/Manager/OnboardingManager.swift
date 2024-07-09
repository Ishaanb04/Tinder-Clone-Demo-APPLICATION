//
//  OnboardingManager.swift
//  Tinder-Interview-Demo
//
//  Created by Ishaan Bhasin on 4/2/24.
//

import Foundation
class OnboardingManager: ObservableObject {
    @Published var navigationPath = [OnboardingSteps]()

    private var currentStep: OnboardingSteps?
    func start() {
        guard let initialStep = OnboardingSteps(rawValue: 0) else { return }
        navigationPath.append(initialStep)
    }

    func navigate() {
        currentStep = navigationPath.last
        guard let index = currentStep?.rawValue else { return }
        guard let nextStep = OnboardingSteps(rawValue: index + 1) else {
            print("Debug: Finish Onboarding")
            return
        }
        navigationPath.append(nextStep)
    }
}
