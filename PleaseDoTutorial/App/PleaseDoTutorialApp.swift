//
//  PleaseDoTutorialApp.swift
//  PleaseDoTutorial
//
//  Created by Gregg Abe on 3/9/25.
//

import SwiftUI
import FirebaseCore

@main
struct PleaseDoTutorialApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
