import Foundation
import SpriteKit
import GameplayKit
class Object: GameScene {
    
 
    func creatBox(imageName: String, xAxis: CGFloat, yAxis: CGFloat,zAxis: CGFloat, width: CGFloat, height: CGFloat ) -> SKSpriteNode {
        let texture = SKTexture(imageNamed: imageName)
        let box = SKSpriteNode(texture: texture)
        box.position = CGPoint(x: xAxis, y: yAxis)
        box.size = CGSize(width: width, height: height)
        box.zPosition = zAxis
        return box
    }
    
    func creatBackground(imageNamed: String, width: CGFloat, height: CGFloat, zAxis: CGFloat) -> SKSpriteNode{
        
        let backgroundTexture = SKTexture(imageNamed: imageNamed)
        background = SKSpriteNode(texture: backgroundTexture)
        background.size = CGSize(width: width, height: height)
        background.zPosition = zAxis
        return background
        
    }
    
    func creatBird(imageName: String, xAxis: CGFloat, yAxis: CGFloat,zAxis: CGFloat, width: CGFloat, height: CGFloat) -> SKSpriteNode {
        let birdTexture = SKTexture(imageNamed: imageName)
        bird = SKSpriteNode(texture: birdTexture)
        bird.position = CGPoint(x: xAxis, y: yAxis)
        bird.size = CGSize(width: width, height: height)
        bird.zPosition = zAxis
        return bird
        
    }
    
    func creatTree(imageName: String, xAxis: CGFloat, yAxis: CGFloat,zAxis: CGFloat, width: CGFloat, height: CGFloat) -> SKSpriteNode {
        let treeTexture = SKTexture(imageNamed: imageName)
        tree = SKSpriteNode(texture: treeTexture)
        tree.position = CGPoint(x: xAxis, y: yAxis)
        tree.size = CGSize(width: width, height: height)
        tree.zPosition = zAxis
        return tree
        
    }
    
    
}
