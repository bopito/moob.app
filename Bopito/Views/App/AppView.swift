//
//  AppView.swift
//  Bopito
//
//  Created by Hans Heidmann on 8/28/24.
//

import SwiftUI

struct AppView: View {
    

    @State private var selectedTab: TabSelection = .profile
    
    var body: some View {
        
        TabView (selection: $selectedTab) {
           
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape.fill")
                }
                .tag(TabSelection.settings)
            
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
                .tag(TabSelection.home)
            
            ComposeView()
                .tabItem {
                    Label("Share", systemImage: "plus.circle.fill")
                }
                .tag(TabSelection.compose)
            
            NotificationsView()
                .tabItem {
                    Label("Ding", systemImage: "bell.fill")
                }
                .tag(TabSelection.notifications)
            
            ProfileView()
                .tabItem {
                    Label("Me", systemImage: "person.fill")
                }
                .tag(TabSelection.profile)
        }
        
    }
}

enum TabSelection {
    case settings
    case home
    case compose
    case notifications
    case profile
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
            .environmentObject(AuthManager())
            .preferredColorScheme(.dark)
    }
}
