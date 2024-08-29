//
//  AuthManager.swift
//  Bopito
//
//  Created by Hans Heidmann on 8/28/24.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

class AuthManager: ObservableObject {
    @Published var isAuthenticated: Bool = false
    @Published var user: User?
    
    private var authStateListenerHandle: AuthStateDidChangeListenerHandle?
    
    var currentUser: User? {
        return Auth.auth().currentUser
    }
    
    init() {
        authStateListenerHandle = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            self?.user = user
            self?.isAuthenticated = (user != nil)
        }
    }
    
    deinit {
        if let handle = authStateListenerHandle {
            Auth.auth().removeStateDidChangeListener(handle)
        }
    }
    
    func anonRegister() {
        Auth.auth().signInAnonymously { authResult, error in
            if let error = error {
                print("Error signing in anonymously: \(error.localizedDescription)")
                return
            }
            self.updateUserDisplayName(username: "anonymous")
            self.isAuthenticated = true
        }
    }
    
    func register(email: String, password: String) async throws {
        _ = try await Auth.auth().createUser(withEmail: email, password: password)
        DispatchQueue.main.async {
            self.isAuthenticated = true
        }
    }
    
    func signIn(email: String, password: String) async throws {
        _ = try await Auth.auth().signIn(withEmail: email, password: password)
        DispatchQueue.main.async {
            self.isAuthenticated = true
        }
    }
    
    func signOut() {
        do {
            print("signing out...")
            try Auth.auth().signOut()
            self.isAuthenticated = false
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError.localizedDescription)
        }
    }
    
    
    
    
    //
    // Submitting Posts and Replies
    //
    
    func submitPost(post: Post) {
        let db = Firestore.firestore()
        print("test")
        do {
            // Convert the Post object to a dictionary and save it
            try db.collection("Posts").document(post.id.uuidString).setData(from: post)
            print("Post submitted successfully.")
        } catch let error {
            print("Error writing post to Firestore: \(error)")
        }
    }
    
    
    
    //
    // Account Settings
    //
    func updateUserDisplayName(username: String) {
        guard let user = Auth.auth().currentUser else {
            print("No user is logged in.")
            return
        }

        let newDisplayName = "anonymous"
        
        let changeRequest = user.createProfileChangeRequest()
        changeRequest.displayName = newDisplayName
        
        changeRequest.commitChanges { error in
            if let error = error {

                print("Error updating display name: \(error.localizedDescription)")
            } else {
            
                print("Display name updated to \(newDisplayName)")
            }
        }
    }
    
    func updateUserProfilePicture(userId: String, profilePictureName: String) {
        // Update user profile data in Firestore or Realtime Database
        let db = Firestore.firestore()
        let userProfileRef = db.collection("Users").document(userId)
        
        userProfileRef.setData([
            "profilePicture": profilePictureName // Store the name of the profile picture or its URL
        ], merge: true) { error in
            if let error = error {
                print("Error updating profile picture: \(error.localizedDescription)")
            }
        }
    }
    
    func fetchRecentPosts(completion: @escaping ([Post]?, Error?) -> Void) {
        let db = Firestore.firestore()
        
        // Fetch the 100 most recent posts
        db.collection("Posts")
            .order(by: "timestamp", descending: true) // Order by timestamp in descending order
            .limit(to: 100) // Limit to 100 documents
            .getDocuments { querySnapshot, error in
                if let error = error {
                    completion(nil, error)
                    return
                }
                
                var posts: [Post] = []
                for document in querySnapshot!.documents {
                    do {
                        let post = try document.data(as: Post.self)
                        posts.append(post)
                    } catch {
                        completion(nil, error)
                        return
                    }
                }
                
                completion(posts, nil)
            }
    }

}
