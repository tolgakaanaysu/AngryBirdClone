import Foundation
import SpriteKit
import GameplayKit
class Object: GameScene {
    
    enum ColliderType: UInt32 {
        case bird = 1
        case box = 2
    }
 
    func creatBox(imageName: String, xAxis: CGFloat, yAxis: CGFloat,zAxis: CGFloat, width: CGFloat, height: CGFloat ) -> SKSpriteNode {
        let texture = SKTexture(imageNamed: imageName)
        let box = SKSpriteNode(texture: texture)
        box.position = CGPoint(x: xAxis, y: yAxis)
        box.size = CGSize(width: width, height: height)
        box.zPosition = zAxis
        box.physicsBody = SKPhysicsBody(rectangleOf: box.size)
        box.physicsBody?.affectedByGravity = true
        box.physicsBody?.isDynamic = true
        box.physicsBody?.mass = 0.5
        box.physicsBody?.allowsRotation = true
        box.physicsBody?.collisionBitMask = ColliderType.bird.rawValue
        return box
    }
    
    func creatBird(imageName: String, xAxis: CGFloat, yAxis: CGFloat,zAxis: CGFloat, width: CGFloat, height: CGFloat) -> SKSpriteNode {
        let birdTexture = SKTexture(imageNamed: imageName)
        bird = SKSpriteNode(texture: birdTexture)
        bird.position = CGPoint(x: xAxis, y: yAxis)
        bird.size = CGSize(width: width, height: height)
        bird.zPosition = zAxis
        bird.physicsBody = SKPhysicsBody(circleOfRadius: height / 2.5)
        bird.physicsBody?.affectedByGravity = false
        bird.physicsBody?.isDynamic = true
        bird.physicsBody?.mass = 0.3
        bird.physicsBody?.contactTestBitMask = ColliderType.bird.rawValue
        bird.physicsBody?.categoryBitMask = ColliderType.bird.rawValue
        bird.physicsBody?.collisionBitMask = ColliderType.box.rawValue
        return bird
        
    }
    
    func creatBackground(imageNamed: String, width: CGFloat, height: CGFloat, zAxis: CGFloat) -> SKSpriteNode{
        
        let backgroundTexture = SKTexture(imageNamed: imageNamed)
        background = SKSpriteNode(texture: backgroundTexture)
        background.size = CGSize(width: width, height: height)
        background.zPosition = zAxis
        return background
        
    }
    
    
    func creatTree(imageName: String, xAxis: CGFloat, yAxis: CGFloat,zAxis: CGFloat, width: CGFloat, height: CGFloat) -> SKSpriteNode {
        let treeTexture = SKTexture(imageNamed: imageName)
        tree = SKSpriteNode(texture: treeTexture)
        tree.position = CGPoint(x: xAxis, y: yAxis)
        tree.size = CGSize(width: width, height: height)
        tree.zPosition = zAxis
        return tree
        
    }
    
    func creatScoreLabel(labelText: String, xAxis: CGFloat, yAxis: CGFloat ) -> SKLabelNode{
        let label = SKLabelNode()
//        label.fontName = ""
        label.fontSize = 40
        label.fontColor = .red
        label.text = labelText
        label.zPosition = 2
        label.position = CGPoint(x: xAxis, y: yAxis)
        print(yAxis)
        return label
    }
    
    
}
