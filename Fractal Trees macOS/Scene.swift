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
    
    var angle:CGFloat = CGFloat.pi/2
    var rotationConstant:CGFloat = CGFloat.pi/180
    var angleConstant:CGFloat = CGFloat.pi/6

    override func didMove(to view: SKView) {
        let len:CGFloat = 150
        let origin = CGPoint(x: 0, y: -self.size.height/2)
        
        branch(_origin: origin, _angle: angle, _len: len)
        
    }
    
    func branch(_origin: CGPoint, _angle: CGFloat, _len: CGFloat)  {
        var currentLen = _len
        let currentAngle = _angle
        let origin = _origin
        let tip = CGPoint(x: currentLen * cos(currentAngle) + origin.x, y: currentLen * sin(currentAngle) + origin.y)
        
        var path = [origin, tip]
        let line = SKShapeNode(points: &path, count: path.count)
        
        line.lineWidth = 1
        line.strokeColor = .white

        self.addChild(line)
        
        print(currentAngle)
        if(currentLen > 20){
            currentLen *= 0.8
            branch(_origin: tip, _angle: currentAngle - self.angleConstant, _len: currentLen)
            branch(_origin: tip, _angle: currentAngle + self.angleConstant, _len: currentLen)
        }
    }
    
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
        
    }
    
    override func keyDown(with event: NSEvent) {
        switch event.keyCode {
        default:
            print("keyDown: \(event.characters!) keyCode: \(event.keyCode)")
        }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
//        self.removeAllChildren()
//        branch(_origin: CGPoint(x: 0, y: -self.size.height/2), _angle: angle, len: 100)
//        angle += rotationConstant * 2
//        if(angle > CGFloat.pi || angle < 0){
//             rotationConstant *= -1
//        }
    }
}
