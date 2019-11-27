//
//  Branch.swift
//  Fractal Trees macOS
//
//  Created by Pratchaya Khansomboon on 2019-11-27.
//  Copyright © 2019 Pratchaya Khansomboon. All rights reserved.
//

import SpriteKit

class Branch{
    // MARK: Variables
    var origin:CGPoint
    var tip:CGPoint
    var angle:CGFloat {
        didSet {
            self.tip = CGPoint(x: self.len * cos(self.angle) + self.origin.x, y: self.len * sin(self.angle) + self.origin.y)
        }
    }
    var rol: Bool = false
    var len:CGFloat
    var angleSlope:CGFloat = CGFloat.pi/4
    var growned:Bool = false
    
    var lineWdith:CGFloat = 2
    var shrinkConstant:CGFloat = 0.7
    
    // MARK: Init
    init(origin: CGPoint, angle: CGFloat, len: CGFloat) {
        self.origin = origin
        self.angle = angle
        self.len = len
        
        self.tip = CGPoint(x: self.len * cos(self.angle) + self.origin.x, y: self.len * sin(self.angle) + self.origin.y)
    }
    
    // MARK: Functions
    func branch(rol: Bool) -> Branch{
        self.growned = true
        self.rol = rol
        let newAngle = self.rol ? self.angle + angleSlope * -1 : self.angle + angleSlope
        let newLen = self.len * self.shrinkConstant
        let b = Branch(origin: self.tip, angle: newAngle, len: newLen)
        return b
    }
    
    func reBranch(branches: [Branch]) -> [Branch] {
        let newTree = branches
        for b in newTree {
            if(b.len != self.len){
                b.origin = self.tip
                let newAngle = b.rol ? b.angle + angleSlope * -1 : b.angle + angleSlope
                b.angle = newAngle
            }
            
        }
        return newTree
    }
    
    // MARK: DRAW
    func draw(scene: SKScene) {
        var path = [origin, tip]
        let line = SKShapeNode(points: &path, count: path.count)

        line.lineWidth = self.lineWdith
        line.strokeColor = .white

        scene.addChild(line)
    }
}
