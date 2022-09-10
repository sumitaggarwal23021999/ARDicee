//
//  ViewController.swift
//  ARDicee
//
//  Created by Mayank Sharma  on 04/09/22.
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
        
        
        //MARK: Craeting of a cube
//        let cube = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.01)
//        let material = SCNMaterial()
//        material.diffuse.contents = UIColor.red
//        cube.materials = [material]
//        let node = SCNNode()
//        node.position = SCNVector3(x: 0, y: 1, z: -0.5)
//        node.geometry = cube
//        sceneView.scene.rootNode.addChildNode(node)
//        sceneView.automaticallyUpdatesLighting = true
        
        //MARK: Craeting of a Sphere(Moon)
        let sphere = SCNSphere(radius: 0.2)
        let material = SCNMaterial()
        material.diffuse.contents = UIImage(named: "art.scnassets/moon.jpeg")
        sphere.materials = [material]
        let node = SCNNode()
        node.position = SCNVector3(x: 0, y: 1, z: -0.5)
        node.geometry = sphere
        sceneView.scene.rootNode.addChildNode(node)
        sceneView.automaticallyUpdatesLighting = true
        
        // Create a new scene
//        let scene = SCNScene(named: "art.scnassets/ship.scn")!
//
//        // Set the scene to the view
//        sceneView.scene = scene
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
//        let configuration = ARWorldTrackingConfiguration()
        let configuration = ARWorldTrackingConfiguration()
        debugPrint(AROrientationTrackingConfiguration.isSupported)

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
}
