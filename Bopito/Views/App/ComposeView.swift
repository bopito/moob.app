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
            
            Button(action: submitPost) {
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
    
    
    private func submitPost() {
        // Ensure the user is authenticated
        guard let user = authManager.currentUser else {
            print("User is not authenticated.")
            return
        }
        
        // Create a new Submission
        let newSubmission = Post(
            id: UUID(),
            author: user.displayName ?? "anonymous1",
            timestamp: Date(),
            replies: [],
            repliesCount: 0,
            likesCount: 0,
            likers: [],
            text: postText
        )
        
        // Save the new post to Firebase
        
        
        authManager.submitPost(post: newSubmission)
        
        print("Post submitted: \(newSubmission)")
        // Clear the text editor
        postText = ""
        
        
        
    }
}


#Preview {
    ComposeView()
        .environmentObject(AuthManager())
        .preferredColorScheme(.dark)
}


