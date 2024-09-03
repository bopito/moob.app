//
//  User.swift
//  Bopito
//
//  Created by Hans Heidmann on 8/31/24.
//

import Foundation
import SwiftUI

class User: Identifiable, Codable {
    var id: String
    var timestamp: Date
    var email: String
    var password: String
    var username: String
    var bio: String
    var picture: URL
    var followers: [User]
    var following: [User]
    var blocking: [User]
    var verified: Bool
    
    
    init(id: String,
         timestamp: Date = Date(),
         email: String = "",
         password: String = "",
         username: String,
         bio: String = "",
         picture: URL,
         followers: [User] = [],
         following: [User] = [],
         blocking: [User] = [],
         verified: Bool = false
    ) {
        self.id = id
                self.timestamp = timestamp
                self.email = email
                self.password = password
                self.username = username
                self.bio = bio
                self.picture = picture
                self.followers = followers
                self.following = following
                self.blocking = blocking
                self.verified = verified
    }
}
