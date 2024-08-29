//
//  Submission.swift
//  Bopito
//
//  Created by Hans Heidmann on 8/28/24.
//
import SwiftUI
import Foundation

class Reply: Identifiable, Codable {
    var id = UUID() // Ensure that each Submission has a unique ID
    var author: String
    var timestamp: Date
    var replies: [Reply]
    var repliesCount: Int
    var likesCount: Int
    var likers: [String]
    var text: String
    
    init(id: UUID, author: String, timestamp: Date, replies: [Reply], repliesCount: Int, likesCount: Int, likers: [String], text: String) {
        self.id = id
        self.author = author
        self.timestamp = timestamp
        self.replies = replies
        self.repliesCount = repliesCount
        self.likesCount = likesCount
        self.likers = likers
        self.text = text
    }
}
