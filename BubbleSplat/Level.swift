//
//  Level.swift
//  BubbleSplat
//
//  Created by James Pearce on 9/4/19.
//  Copyright © 2019 3 Crowns Consulting. All rights reserved.
//

import Foundation

let numColumns = 9
let numRows = 9

class Level {
    private var bubbles = Array2D<Bubble>(columns: numColumns, rows: numRows)
    
    func bubble (atColumn column: Int, row: Int) -> Bubble? {
        precondition(column >= 0 && column < numColumns)
        precondition(row >= 0 && row < numRows)
        return bubbles[column, row]
    }
    
    func shuffle() -> Set<Bubble> {
        return createInitialBubbles()
    }
    
    private func createInitialBubbles() -> Set<Bubble> {
        var set: Set<Bubble> = []
        
        for row in 0..<numRows {
            for column in 0..<numColumns {
                let bubbleType = BubbleType.random()
                
                let bubble = Bubble(column: column, row: row, bubbleType: bubbleType)
                bubbles[column, row] = bubble
                
                set.insert(bubble)
            }
        }
        return set
    }
}
