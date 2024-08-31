//
//  RandomUsername.swift
//  Bopito
//
//  Created by Hans Heidmann on 8/30/24.
//

class RandomUsername {
    
    // List of mixed adjectives
    let adjectives = [
        "Able", "Brave", "Chill", "Creepy", "Eager", "Epic", "Funky", "Groovy", "Happy", "Jolly",
        "Lucky", "Magical", "Nifty", "Odd", "Quirky", "Random", "Scary", "Silly", "Sunny", "Weird",
        "Zany", "Angelic", "Bizarre", "Brisk", "Cheery", "Clever", "Crafty", "Fierce", "Giddy", "Heroic",
        "Jaunty", "Jumpy", "Mellow", "Mighty", "Nimble", "Perky", "Plucky", "Proud", "Radiant", "Rapid",
        "Savage", "Spooky", "Swift", "Tricky", "Wicked", "Zippy", "Lively", "Lofty", "Vibrant", "Witty"
    ]
    let nouns: [String] = [
        "Apple", "Bird", "Book", "Bread", "Bunny", "Candle", "Chair", "Clock", "Cloud",
        "Cookie", "Dragon", "Eagle", "Flower", "Guitar", "Helmet", "Kitten", "Laptop",
        "Lizard", "Mirror", "Orange", "Pencil", "Planet", "Potato", "Rabbit", "Rocket",
        "Shell", "Shield", "Spider", "Sunset", "Tiger", "Tree", "Unicorn", "Whale", "Window",
        "Button", "Camera", "Spoon", "Bottle", "Folder", "Jacket", "Gloves", "Basket",
        "Puzzle", "Pillow", "Banner", "Toy", "Brush", "Towel", "Clock", "Dice"
    ]
    
    // Function to generate a random username
    func generateUsername() -> String {
        // Select a random adjective from the list
        let randomAdjective = adjectives.randomElement() ?? "Epic"
        
        // Generate a random number
        let randomNumber = Int.random(in: 1000...9999)
        
        // Combine the adjective and the number to create a username
        return "\(randomAdjective)\(randomNumber)"
    }
}
