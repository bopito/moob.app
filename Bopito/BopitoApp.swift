//
//  BopitoApp.swift
//  Bopito
//
//  Created by Hans Heidmann on 8/28/24.
//

import SwiftUI
import SwiftData
import Firebase

@main
struct BopitoApp: App {
    
    @StateObject var authManager = AuthManager()
    
    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(authManager)
        }
    }
}
