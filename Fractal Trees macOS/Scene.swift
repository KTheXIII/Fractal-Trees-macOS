//
//  GameScene.swift
//  Fractal Trees macOS
//
//  Created by Pratchaya Khansomboon on 2019-11-27.
//  Copyright © 2019 Pratchaya Khansomboon. All rights reserved.
//

import SpriteKit
import GameplayKit

class Scene: SKScene {
    
    // MARK: Variables
    var angle:CGFloat = CGFloat.pi/2
    var rotationConstant:CGFloat = CGFloat.pi/180
    var angleConstant:CGFloat = CGFloat.pi/180
    var angleSlope:CGFloat = CGFloat.pi/6
    
    var len:CGFloat = 200
    
    var totalBranches:Int = 0
    var origin = CGPoint()
    
    var tree:[Branch] = []
    
    
    
    // MARK: Start Function
    override func didMove(to view: SKView) {
        origin = CGPoint(x: 0, y: -self.size.height/2)
        let root = Branch(origin: origin, angle: angle, len: len)
        tree.append(root)
      
    }
    
    // MARK: Functions
    func addBranches() {
        if(self.children.count < 4096 - 1){
            for b in tree.reversed(){
                if(!b.growned){
                    tree.append(b.branch(rol: true))
                    tree.append(b.branch(rol: false))
                }
            }
        }
    }
    
    // MARK: Inputs
    func touchDown(atPoint pos : CGPoint) {
      
    }
    
    func touchMoved(toPoint pos : CGPoint) {
       
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    override func mouseDown(with event: NSEvent) {
        
    }
    
    override func mouseDragged(with event: NSEvent) {
        
    }
    
    override func mouseUp(with event: NSEvent) {
       addBranches()
    }
    
    override func keyDown(with event: NSEvent) {
        switch event.keyCode {
        case 49:
//            self.isPaused = !self.isPaused
            tree = tree[0].reBranch(branches: tree)
        case 123:
            angleSlope -= CGFloat.pi/180
            tree[0].angle += angleSlope * 2
        case 124:
            angleSlope += CGFloat.pi/180
            tree[0].angle -= angleSlope * 2
        case 125:
            len -= 10
        case 126:
            len += 10
        default:
            print("keyDown: \(event.characters!) keyCode: \(event.keyCode)")
        }
        
    }
    
    // MARK: Game Loop
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        self.removeAllChildren()
        
        for branch in tree {
            branch.draw(scene: self)
        }
        
    }
}
