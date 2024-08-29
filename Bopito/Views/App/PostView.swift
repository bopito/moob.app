//
//  PostView.swift
//  Bopito
//
//  Created by Hans Heidmann on 8/28/24.
//

import SwiftUI

struct PostView: View {
    
    var post: Post
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                // author
                Text(post.author)
                    .font(.headline)
                    .foregroundColor(.primary)
                // time
                Text(post.timestamp, style: .time)
                    .font(.caption)
                    .foregroundColor(.gray)
                // date
                Text(post.timestamp, style: .date)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            // body text
            Text(post.text)
                .font(.body)
                .foregroundColor(.secondary)
            
            HStack {
                Image(systemName: "bubble.left") // Speech bubble icon
                    .font(.body)
                    .foregroundColor(.gray)
                Text("\(post.repliesCount)")
                    .font(.body)
                    .foregroundColor(.gray)
                
                
                Spacer()
                
                
                Image(systemName: "heart") // Heart icon for likes
                    .font(.body)
                    .foregroundColor(.gray)
                Text("\(post.likesCount)")
                    .font(.body)
                    .foregroundColor(.gray)
            }
            
            
        }
        .background(Color(.systemGray6))
        .cornerRadius(8)
    }
}

#Preview {
    PostView(post: Post(id: UUID(), author: "@hans", timestamp: Date(), replies: [], repliesCount: 1, likesCount: 1, likers: [], text: "test"))
        .environmentObject(AuthManager())
        .preferredColorScheme(.dark)
}
