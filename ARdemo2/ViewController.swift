//
//  ViewController.swift
//  ARdemo2
//
//  Created by Sebastian Strus on 2021-08-16.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {
    
    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // add shadow
        sceneView.autoenablesDefaultLighting = true
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = false
        
        // Create a new scene
        //        let scene = SCNScene(named: "art.scnassets/ship.scn")!
        let scene = SCNScene()
        
        // Set the scene to the view
        sceneView.scene = scene
        
        addEarthToScene()
//        addBlueSphereToScene()
//        addGreenSphereToScene()
//        //addShipToScene()
//        
//        addBottomBoxToScene()
//        addTopBoxToScene()
//        addMiddleBoxToScene()
//        
//        addText()
//        
//        
//        addImage()
    }
    
    private func addEarthToScene() {
        let sphere = SCNSphere(radius: 1)
        sphere.firstMaterial?.diffuse.contents = UIImage(named: "earth7") //UIColor.blue
        let sphereNode = SCNNode(geometry: sphere)
        sphereNode.position = SCNVector3(0, 0, -0.8) // z: distance from you to object
        
        
        let rotateAction = SCNAction.rotateBy(x: 0, y: CGFloat(GLKMathDegreesToRadians(360)), z: 0, duration: 24)
        let forever = SCNAction.repeatForever(rotateAction)
        sphereNode.runAction(forever)
        
        sceneView.scene.rootNode.addChildNode(sphereNode)
    }
    
    private func addBlueSphereToScene() {
        let sphere = SCNSphere(radius: 0.2)
        sphere.firstMaterial?.diffuse.contents = UIColor.blue
        let sphereNode = SCNNode(geometry: sphere)
        sphereNode.position = SCNVector3(-1, 0, 0) // z: distance from you to object
        
        let moveUp = SCNAction.moveBy(x: 0, y: 0.5, z: 0, duration: 0.5)
        moveUp.timingMode = .easeInEaseOut;
        let moveDown = SCNAction.moveBy(x: 0, y: -0.5, z: 0, duration: 0.5)
        moveDown.timingMode = .easeInEaseOut;
        let moveSequence = SCNAction.sequence([moveUp,moveDown])
        let moveLoop = SCNAction.repeatForever(moveSequence)
        sphereNode.runAction(moveLoop)
        
        sceneView.scene.rootNode.addChildNode(sphereNode)
    }
    
    private func addGreenSphereToScene() {
        let sphere = SCNSphere(radius: 0.2)
        sphere.firstMaterial?.diffuse.contents = UIColor.green
        let sphereNode = SCNNode(geometry: sphere)
        sphereNode.position = SCNVector3(0, 1, -0.8) // z: distance from you to object
        
        
        let anim = CABasicAnimation(keyPath: "rotation")
        anim.fromValue = NSValue(scnVector4: SCNVector4(x: 0, y: 1, z: 0, w: 0))
        anim.toValue = NSValue(scnVector4: SCNVector4(x: 0, y: 1, z: 0, w: Float(2 * Double.pi)))
        anim.duration = 60
        anim.repeatCount = .infinity
        //parentNode.addAnimation(anim, forKey: "spin around")
        
        sceneView.scene.rootNode.addChildNode(sphereNode)
        
        
        //        let moveRight = SCNAction.moveBy(x: 1, y: 0, z: 0, duration: 1)
        //        moveRight.timingMode = .easeInEaseOut;
        //
        //        let moveLeft = SCNAction.moveBy(x: -1, y: 0, z: 0, duration: 1)
        //        moveLeft.timingMode = .easeInEaseOut;
        //
        //        let moveSequence = SCNAction.sequence([moveRight,moveLeft])
        //        let moveLoop = SCNAction.repeatForever(moveSequence)
        //        sphereNode.runAction(moveLoop)
        //
        //        let moveFrontA = SCNAction.moveBy(x: 0, y: 0, z: 0.5, duration: 0.5)
        //        moveFrontA.timingMode = .easeInEaseOut;
        //        let moveBack = SCNAction.moveBy(x: 0, y: 0, z: -1, duration: 1)
        //        moveBack.timingMode = .easeInEaseOut;
        //        let moveFrontB = SCNAction.moveBy(x: 0, y: 0, z: 0.5, duration: 0.5)
        //        moveFrontB.timingMode = .easeInEaseOut;
        //        let moveSequence2 = SCNAction.sequence([moveFrontA,moveBack,moveFrontB])
        //        let moveLoop2 = SCNAction.repeatForever(moveSequence2)
        //        sphereNode.runAction(moveLoop2)
        
        
        sceneView.scene.rootNode.addChildNode(sphereNode)
    }
    
    private func addShipToScene() {
        let subScene = SCNScene(named: "art.scnassets/ship.scn")!
        let shipNode = subScene.rootNode.childNode(withName: "ship", recursively: true)!
        shipNode.position = SCNVector3(-1.5, -0.5, -2)
        
        let animation = CABasicAnimation(keyPath: "geometry.extrusionDepth")
        animation.fromValue = 0.0
        animation.toValue = 100.0
        animation.duration = 1.0
        animation.autoreverses = true
        animation.repeatCount = .infinity
        shipNode.addAnimation(animation, forKey: "extrude")
        
        
        //        let moveRight = SCNAction.moveBy(x: 1, y: 0, z: 0, duration: 1)
        //        moveRight.timingMode = .easeInEaseOut;
        //        let moveLeft = SCNAction.moveBy(x: -1, y: 0, z: 0, duration: 1)
        //        moveLeft.timingMode = .easeInEaseOut;
        //        let moveSequence = SCNAction.sequence([moveRight,moveLeft])
        //        let moveLoop = SCNAction.repeatForever(moveSequence)
        //        shipNode.runAction(moveLoop)
        //
        //        let moveFrontA = SCNAction.moveBy(x: 0, y: 0, z: 0.5, duration: 0.5)
        //        moveFrontA.timingMode = .easeInEaseOut;
        //        let moveBack = SCNAction.moveBy(x: 0, y: 0, z: -1, duration: 1)
        //        moveBack.timingMode = .easeInEaseOut;
        //        let moveFrontB = SCNAction.moveBy(x: 0, y: 0, z: 0.5, duration: 0.5)
        //        moveFrontB.timingMode = .easeInEaseOut;
        //        let moveSequence2 = SCNAction.sequence([moveFrontA,moveBack,moveFrontA])
        //        let moveLoop2 = SCNAction.repeatForever(moveSequence2)
        //        shipNode.runAction(moveLoop2)
        
        
        //        let anim = CABasicAnimation(keyPath: "rotation")
        //        anim.fromValue = NSValue(scnVector4: SCNVector4(x: 0, y: 1, z: 0, w: 0))
        //        anim.toValue = NSValue(scnVector4: SCNVector4(x: 0, y: 1, z: 0, w: Float(2 * Double.pi)))
        //        anim.duration = 60
        //        anim.repeatCount = .infinity
        //        shipNode.addAnimation(anim, forKey: "spin around")
        
        sceneView.scene.rootNode.addChildNode(shipNode)
    }
    
    private func addBottomBoxToScene() {
        let box = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0)
        box.firstMaterial?.diffuse.contents = UIColor.green
        let boxNode = SCNNode(geometry: box)
        boxNode.position = SCNVector3(1,-0.5,-0.5)
        sceneView.scene.rootNode.addChildNode(boxNode)
    }
    
    private func addTopBoxToScene() {
        let box = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0)
        box.firstMaterial?.diffuse.contents = UIColor.green
        let boxNode = SCNNode(geometry: box)
        boxNode.position = SCNVector3(1,0.5,-0.5)
        sceneView.scene.rootNode.addChildNode(boxNode)
    }
    
    private func addMiddleBoxToScene() {
        let box = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0)
        box.firstMaterial?.diffuse.contents = UIColor.orange
        let boxNode = SCNNode(geometry: box)
        boxNode.position = SCNVector3(1,-0.4,-0.5)
        
        let moveUp = SCNAction.moveBy(x: 0, y: 0.8, z: 0, duration: 0.5)
        moveUp.timingMode = .easeInEaseOut;
        let moveDown = SCNAction.moveBy(x: 0, y: -0.8, z: 0, duration: 0.5)
        moveDown.timingMode = .easeInEaseOut;
        let moveSequence = SCNAction.sequence([moveUp,moveDown])
        let moveLoop = SCNAction.repeatForever(moveSequence)
        boxNode.runAction(moveLoop)
        
        sceneView.scene.rootNode.addChildNode(boxNode)
    }
    
    
    func addText() {
        let text = SCNText(string: "HiQ", extrusionDepth: 1)
        
        text.font = UIFont(name: "Arial", size: 10)
        text.flatness = 0.2
        //create a material object
        let material = SCNMaterial()
        //set the material to blue colot
        material.diffuse.contents = UIColor.white
        //assigns the material to my text
        text.materials = [material]
        
        //create a node object
        let node = SCNNode()
        //sets the position of this node
        node.position = SCNVector3(-2,-2,-1)
        node.localRotate(by: SCNQuaternion(x: 0, y: 0.7071, z: 0, w: 0.7071))
        //sets the size of the text
        node.scale = SCNVector3(x: 0.3, y: 0.3, z: 0.3)

        //sets the text geometry to the node object
        node.geometry = text
        
        //Adds the node to the sceneView
        sceneView.scene.rootNode.addChildNode(node)
        //Enables ightning to display shadows
        sceneView.automaticallyUpdatesLighting = true
    }
    
    
    
    func addImage() {
        let image = UIImage(named: "cat")
        let node = SCNNode(geometry: SCNPlane(width: 1, height: 1))
        node.localRotate(by: SCNQuaternion(x: 0, y: -0.7071, z: 0, w: 0.7071))
        
        node.position = SCNVector3(1,-0.3,-2)
        node.scale = SCNVector3(x: 1.5, y: 1.5, z: 1.5)
        node.geometry?.firstMaterial?.diffuse.contents = image
        sceneView.scene.rootNode.addChildNode(node)
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    // MARK: - ARSCNViewDelegate
    
    /*
     // Override to create and configure nodes for anchors added to the view's session.
     func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
     let node = SCNNode()
     
     return node
     }
     */
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
