
import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate{
    
    var tree = SKSpriteNode()
    var background = SKSpriteNode()
    var bird = SKSpriteNode()
    var box1 = SKSpriteNode()
    var box2 = SKSpriteNode()
    var box3 = SKSpriteNode()
    var box4 = SKSpriteNode()
    var box5 = SKSpriteNode()
    var score = 0
    var scoreLabel = SKLabelNode()
   
    var gameStarted = false
   
    var birdOriginalPosition = CGPoint()
    
   
    override func didMove(to view: SKView) {
        
//      Oyun objelerini yarat
        
        background = Object().creatBackground(imageNamed: "background", width: frame.width, height: frame.height, zAxis: -1)
        addChild(background)
        
        scoreLabel = Object().creatScoreLabel(labelText: "Score: \(String(score)) ",xAxis: 0, yAxis: frame.height / 3.5)
        addChild(scoreLabel)
        
        box1 = Object().creatBox(imageName: "box", xAxis: frame.width / 6, yAxis: -(frame.height / 2.5) + (frame.height / 15) / 2 ,zAxis: 1, width: frame.width / 18, height: frame.height / 15)
        addChild(box1)
        
        box2 = Object().creatBox(imageName: "box", xAxis: (box1.position.x) + 2 * (box1.size.width), yAxis: box1.position.y,zAxis: 1, width: box1.size.width, height: box1.size.height)
        addChild(box2)
        
        box3 = Object().creatBox(imageName: "box", xAxis: box1.position.x + ( (3 * (box1.size.width)) / 2), yAxis: box1.position.y + box1.size.height,zAxis: 1, width: box1.size.width, height: box1.size.height)
        addChild(box3)
        
        box4 = Object().creatBox(imageName: "box", xAxis: box1.position.x + box1.size.width / 2, yAxis: box1.position.y + box1.size.height, zAxis: 1, width: box1.size.width, height: box1.size.height)
        addChild(box4)
        
        box5  = Object().creatBox(imageName: "box", xAxis: box1.position.x + box1.size.width, yAxis: box1.position.y + 2 * box1.size.height, zAxis: 1, width: box1.size.width, height: box1.size.height)
        addChild(box5)
        
        bird = Object().creatBird(imageName: "bird", xAxis:  -frame.width / 3.5, yAxis: -frame.height / 6.5, zAxis: 1, width: frame.width / 15, height: frame.height / 10)
        addChild(bird)
        
        tree = Object().creatTree(imageName: "tree", xAxis:  -frame.width / 3.5, yAxis: -frame.height / 3.5, zAxis: 0.5, width: frame.width / 10, height: frame.height / 2)
        addChild(tree)
        birdOriginalPosition = bird.position
        
//      Fizksel dünya ayarlamarı
        physicsWorld.contactDelegate = self
        physicsWorld.gravity = .init(dx: 0, dy: -2.5)
      
        let rect = CGRect(x: -frame.width / 2, y : -frame.height / 2.5  , width: frame.width, height: frame.height)
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: rect)
        
    }
   
    
    func didBegin(_ contact: SKPhysicsContact) {
       
        if contact.bodyA.collisionBitMask == Object.ColliderType.bird.rawValue || contact.bodyB.collisionBitMask == Object.ColliderType.bird.rawValue {
            score += 1
            
        }
    }
    
    func touchToMove(touchPoint: Set<UITouch>){
      
        if gameStarted == false {
            
            if let touch = touchPoint.first {
            
                let touchLocation = touch.location(in: self)
                let touchNode = nodes(at: touchLocation)
           
                if touchNode.isEmpty == false {
                    
                    for node in touchNode {
                        
                        if let sprite = node as? SKSpriteNode {
                            
                            if sprite == bird {
                               
                                bird.position = touchLocation
                                
                            }
                        }
                    }
                }
            }
        }
    }
    
  
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       
        touchToMove(touchPoint: touches)
      
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
      
        touchToMove(touchPoint: touches)
    
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if gameStarted == false {
            
            if let touch = touches.first {
            
                let touchLocation = touch.location(in: self)
                let touchNode = nodes(at: touchLocation)
           
                if touchNode.isEmpty == false {
                    
                    for node in touchNode {
                        
                        if let sprite = node as? SKSpriteNode {
                            
                            if sprite == bird {
                                
                                let dx = touchLocation.x - birdOriginalPosition.x
                                let dy = touchLocation.y - birdOriginalPosition.y
                                let impulse = CGVector(dx: -dx, dy: -dy)
                                
                                bird.physicsBody?.applyImpulse(impulse)
                                bird.physicsBody?.affectedByGravity = true
                                
                                gameStarted = true
                              
                            }
                        }
                    }
                }
            }
        }
    }
    
    
    
    
    override func update(_ currentTime: TimeInterval) {
        
        scoreLabel.text = "Score: \(String(score)) "
       
           
        if gameStarted == true {
            if let birdPhysicsBody = bird.physicsBody {
                
//                  kuş durduğunda tekrar fırtlatma konumuna getir
                    if birdPhysicsBody.velocity.dx <= 0.1 && birdPhysicsBody.velocity.dy <= 0.1 {
                        
                        if score >= 5 {
                            score = 0
                            
                        }
                      
                        birdPhysicsBody.affectedByGravity = false
                        birdPhysicsBody.velocity = CGVector(dx: 0, dy: 0)
                        birdPhysicsBody.angularVelocity = 0
                        bird.position = birdOriginalPosition
                        gameStarted = false
                        
                    }
            }
        }
        
    }
    
}
