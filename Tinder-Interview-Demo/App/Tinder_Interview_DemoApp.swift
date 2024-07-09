//
//  Tinder_Interview_DemoApp.swift
//  Tinder-Interview-Demo
//
//  Created by Ishaan Bhasin on 3/14/24.
//

import FirebaseCore
import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool
    {
        FirebaseApp.configure()

        return true
    }
}

@main
struct Tinder_Interview_DemoApp: App {
    @StateObject var matchManager = MatchManager(service: MatchService())
    @StateObject var authManager = AuthManager(service: AuthService())
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(authManager)
        }
    }
}
