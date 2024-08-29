//
//  ContentView.swift
//  Bopito
//
//  Created by Hans Heidmann on 8/28/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @EnvironmentObject var authManager: AuthManager
    
    var body: some View {
        
        if authManager.isAuthenticated {
            AppView()
                .preferredColorScheme(.dark)
            
        } else {
            //RegisterView()
            Button(action: {
                authManager.anonRegister()
            }) {
                Text("I accept EULA terms")
                    .font(.headline)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
               
        }
            
            
    }
    
    
}

#Preview {
    ContentView()
        .environmentObject(AuthManager())
      
    
}
