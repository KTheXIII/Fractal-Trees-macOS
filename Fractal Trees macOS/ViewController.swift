//
//  ViewController.swift
//  Fractal Trees macOS
//
//  Created by Pratchaya Khansomboon on 2019-11-27.
//  Copyright © 2019 Pratchaya Khansomboon. All rights reserved.
//

import Cocoa
import SpriteKit
import GameplayKit

class ViewController: NSViewController {

    @IBOutlet var skView: SKView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let view = self.skView {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "Scene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
//                scene.scaleMode = .resizeFill
                
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
//            view.showsFPS = true
//            view.showsNodeCount = true
        }
    }
}

