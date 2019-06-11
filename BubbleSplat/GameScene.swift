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
    let cookiesLayer = SKNode()
    
    // Sound FX
    let swapSound = SKAction.playSoundFileNamed("Chomp.wav", waitForCompletion: false)
    let invalidSwapSound = SKAction.playSoundFileNamed("Error.wav", waitForCompletion: false)
    let matchSound = SKAction.playSoundFileNamed("Ka-Ching.wav", waitForCompletion: false)
    let fallingCookieSound = SKAction.playSoundFileNamed("Scrape.wav", waitForCompletion: false)
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
        cookiesLayer.position = layerPosition
        gameLayer.addChild(cookiesLayer)
        
    }
    
}


