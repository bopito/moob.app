//
//  ProfileView.swift
//  Bopito
//
//  Created by Hans Heidmann on 8/28/24.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var authManager: AuthManager
    
    var body: some View {
        VStack {
            // Profile picture placeholder
            ZStack {
                Circle()
                    .strokeBorder(Color.gray, lineWidth: 4) // Gray outline
                    .background(Circle().fill(Color.black)) // White background
                    .frame(width: 120, height: 120) // Slightly larger than the image
                
                Image("bat")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .padding()
                
            }
            
            
            // Buttons in an HStack
            HStack {
                Button(action: {
                    // Action for the "Posts" button
                    print("Posts button tapped")
                }) {
                    Text("Posts")
                        .frame(maxWidth: .infinity) // Make the button take up all available width
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 0))
                }
                
                Button(action: {
                    // Action for the "Comments" button
                    print("Comments button tapped")
                }) {
                    Text("Comments")
                        .frame(maxWidth: .infinity) // Make the button take up all available width
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 0))
                }
                
                Button(action: {
                    // Action for the "Likes" button
                    print("Likes button tapped")
                }) {
                    Text("Likes")
                        .frame(maxWidth: .infinity) // Make the button take up all available width
                        .padding()
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 0))
                }
            }
            .frame(width: UIScreen.main.bounds.width) // Ensure HStack takes up full width
            .padding()
            
            Spacer()
        }
    }
}

#Preview {
    ProfileView()
        .environmentObject(AuthManager())
        .preferredColorScheme(.dark)
    
}
