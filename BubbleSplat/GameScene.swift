//
//  GameScene.swift
//  BubbleSplay
//
//  Created by James Pearce on 7/4/19.
//  Copyright © 2019 3 Crowns Consulting. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    var level: Level!
    
    let tileWidth: CGFloat = 32.0
    let tileHeight: CGFloat = 36.0
    
    let gameLayer = SKNode()
    let bubblesLayer = SKNode()
    
    // Sound FX
    let swapSound = SKAction.playSoundFileNamed("Chomp.wav", waitForCompletion: false)
    let invalidSwapSound = SKAction.playSoundFileNamed("Error.wav", waitForCompletion: false)
    let matchSound = SKAction.playSoundFileNamed("Ka-Ching.wav", waitForCompletion: false)
    // change
    let fallingCookieSound = SKAction.playSoundFileNamed("Scrape.wav", waitForCompletion: false)
    // change
    let addCookieSound = SKAction.playSoundFileNamed("Drip.wav", waitForCompletion: false)
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder) is not used in this app")
    }
    
    override init(size: CGSize) {
        super.init(size: size)
        
        anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        let background = SKSpriteNode(imageNamed: "Background")
        background.size = size
        addChild(background)
        
        addChild(gameLayer)
        
        let layerPosition = CGPoint(
            x: -tileWidth * CGFloat(numColumns) / 2,
            y: -tileHeight * CGFloat(numRows) / 2
        )
        bubblesLayer.position = layerPosition
        gameLayer.addChild(bubblesLayer)
        
    }
    
    func addSprites(for bubbles: Set<Bubble>) {
        for bubble in bubbles {
            let sprite = SKSpriteNode(imageNamed: bubble.bubbleType.spriteName)
            sprite.size = CGSize(width: tileWidth, height: tileHeight)
            sprite.position = pointFor(column: bubble.column, row: bubble.row)
            bubblesLayer.addChild(sprite)
            bubble.sprite = sprite
        }
    }
    
    private func pointFor(column: Int, row: Int) -> CGPoint {
        return CGPoint(
            x: CGFloat(column) * tileWidth + tileWidth / 2,
            y: CGFloat(row) * tileHeight + tileHeight / 2
        )
    }
    
}


