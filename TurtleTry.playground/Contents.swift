import UIKit
import SpriteKit

var scene = SKScene(size: UIScreen.main.bounds.size)

scene.anchorPoint=CGPoint(x:0.5 ,y:0.5)

let image=SKSpriteNode(imageNamed: "TurtleFlat.png")




scene.addChild(image)

if let SKView = self.view as? SKView {
    SKView.presentScene(scene)
}
