//
//  Bubble.swift
//  BubbleSplat
//
//  Created by James Pearce on 9/4/19.
//  Copyright © 2019 3 Crowns Consulting. All rights reserved.
//
// Adadpted from Cookie.swift

import SpriteKit

// MARK – CookieType
enum BubbleType: Int {
    case unknown = 0, clear, black, orange, pink, purple, soap
    
    var spriteName: String {
        let spriteNames = [
            "bubble-clear",
            "bubble-black",
            "bubble-orange",
            "bubble-pink",
            "bubble-purple",
            "bubble-soap"
        ]
        return spriteNames[rawValue - 1]
    }
    
    var highlightedSpriteName: String {
        return spriteName + "-Highlighted"
    } // when the player taps on the bubble
    
    static func random() -> BubbleType {
        return BubbleType(rawValue: Int(arc4random_uniform(6)) + 1)!
    }
}

// MARK – Cookie
class Bubble: CustomStringConvertible, Hashable {
    //  var hashValue: Int {
    //    return row*10 + column
    //  }
    // I rewrote this
    func hash(into hasher: inout Hasher) {
        hasher.combine(row*10 + column)
    }
    
    static func ==(lhs: Bubble, rhs: Bubble) -> Bool {
        return lhs.column == rhs.column && lhs.row == rhs.row
    }
    
    var description: String {
        return "type:\(bubbleType) square:((column),\(row))"
    }
    
    var column: Int
    var row: Int
    let bubbleType: BubbleType
    var sprite: SKSpriteNode?
    
    init(column: Int, row: Int, bubbleType: BubbleType) {
        self.column = column
        self.row = row
        self.bubbleType = bubbleType
    }
}
