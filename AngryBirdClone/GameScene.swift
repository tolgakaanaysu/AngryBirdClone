
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
   

    override func didMove(to view: SKView) {
        
        background = Object().creatBackground(imageNamed: "background", width: frame.width, height: frame.height, zAxis: -1)
        addChild(background)
        
        box1 = Object().creatBox(imageName: "box", xAxis: frame.width / 6, yAxis: (-frame.height / 2.5) + (frame.height / 15) / 2 ,zAxis: 1, width: frame.width / 18, height: frame.height / 15)
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
        
        physicsWorld.gravity = .init(dx: 0, dy: -0.5)
        physicsWorld.contactDelegate = self
        
        
        let rect = CGRect(x: -frame.width / 2, y : -frame.height / 2.5  , width: frame.width, height: frame.height)
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: rect)
        

        
    }
    
    func touchDown(atPoint pos : CGPoint) {
       
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
      
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
      
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
     
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        
    }
    

        
}
