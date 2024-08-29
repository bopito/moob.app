//
//  replyView.swift
//  Bopito
//
//  Created by Hans Heidmann on 8/28/24.
//

import SwiftUI

struct ReplyView: View {
    
    var reply: Reply
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                // author
                Text(reply.author)
                    .font(.headline)
                    .foregroundColor(.primary)
                // time
                Text(reply.timestamp, style: .time)
                    .font(.caption)
                    .foregroundColor(.gray)
                // date
                Text(reply.timestamp, style: .date)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            // body text
            Text(reply.text)
                .font(.body)
                .foregroundColor(.secondary)
            
            HStack {
                Image(systemName: "bubble.left") // Speech bubble icon
                    .font(.body)
                    .foregroundColor(.gray)
                Text("Replies: \(reply.repliesCount)")
                    .font(.body)
                    .foregroundColor(.gray)
                
                
                Spacer()
                
                
                Image(systemName: "heart") // Heart icon for likes
                    .font(.body)
                    .foregroundColor(.gray)
                Text("Likes: \(reply.likesCount)")
                    .font(.body)
                    .foregroundColor(.gray)
            }
            
            
        }
        .background(Color(.systemGray6))
        .cornerRadius(8)
    }
}

