//
//  HomeView.swift
//  Bopito
//
//  Created by Hans Heidmann on 8/28/24.
//

import SwiftUI

struct ComposeView: View {
    
    @State private var postText: String = ""
    @EnvironmentObject var authManager: AuthManager
    
    var body: some View {
        VStack {
            Text("Create a Post")
                .font(.largeTitle)
                .padding()
            
            TextEditor(text: $postText)
                .frame(height: 200)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(8)
            
            Button(action: {
                // Call the submitPost function asynchronously
                Task {
                    do {
                        let post = Post(
                            id: UUID(),
                            author: try await authManager.getUsername(), // Fetch the username
                            timestamp: Date(),
                            replies: [],
                            repliesCount: 0,
                            likesCount: 0,
                            likers: [],
                            text: postText
                        )
                        try await authManager.submitPost(postText: postText)
                        // Clear the text editor on success
                        postText = ""
                        print("Post submitted successfully.")
                    } catch {
                        print("Error submitting post: \(error.localizedDescription)")
                    }
                }
            }) {
                Text("Submit Post")
                    .bold()
                    .frame(width: 150, height: 40)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding()
            .disabled(postText.isEmpty)
            
            Spacer()
        }
        .padding()
    }
    
    
    
    
    
}


#Preview {
    ComposeView()
        .environmentObject(AuthManager())
        .preferredColorScheme(.dark)
}


