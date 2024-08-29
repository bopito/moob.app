//
//  HomeView.swift
//  Bopito
//
//  Created by Hans Heidmann on 8/28/24.
//

import SwiftUI


struct HomeView: View {
    
    @EnvironmentObject var authManager: AuthManager
    
    @State private var posts: [Post] = []
    @State private var isLoading: Bool = true
    @State private var error: Error?
    
    var body: some View {
        VStack {
            if isLoading {
                ProgressView("Loading...")
            } else if let error = error {
                Text("Error loading posts: \(error.localizedDescription)")
            } else {
                ScrollView {
                    VStack(spacing: 8) {
                        ForEach(posts) { post in
                            PostView(post: post)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding()
                                .background(Color(.systemGray6))
                                .cornerRadius(8)
                        }
                    }
                }
                .padding()
            }
        }
        .onAppear {
            authManager.fetchRecentPosts { fetchedPosts, fetchError in
                if let fetchedPosts = fetchedPosts {
                    self.posts = fetchedPosts
                } else {
                    self.error = fetchError
                }
                self.isLoading = false
            }
        }
    }
}


#Preview {

    HomeView()
        .environmentObject(AuthManager())
        .preferredColorScheme(.dark)
}
