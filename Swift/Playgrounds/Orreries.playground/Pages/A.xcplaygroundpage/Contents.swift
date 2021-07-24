//: [Previous](@previous)

import SceneKit
import PlaygroundSupport

let rect = CGRect(x: 0, y: 0, width: 400, height: 400)

let sceneView = SCNView(frame: rect)
sceneView.autoenablesDefaultLighting = true
sceneView.allowsCameraControl = true
sceneView.backgroundColor = .black

let camera = SCNCamera()
let cameraNode = SCNNode()
cameraNode.camera = camera
cameraNode.position = SCNVector3(0, 0, 8)

let scene = SCNScene()
scene.rootNode.addChildNode(cameraNode)

sceneView.scene = scene

PlaygroundPage.current.liveView = sceneView

let box = SCNBox(width: 1, height: 1, length: 2, chamferRadius: 0)

let boxMaterial = SCNMaterial()
boxMaterial.diffuse.contents = "green"
boxMaterial.isDoubleSided = true

box.firstMaterial = boxMaterial

let boxNode = SCNNode(geometry: box)
boxNode.rotation = SCNVector4(0, 1, 0, CGFloat.pi/4)

scene.rootNode.addChildNode(boxNode)

let rotateAnimation = CABasicAnimation(keyPath: "rotation.w")
rotateAnimation.duration = 10
rotateAnimation.toValue = 2 * Float.pi + Float.pi/4
rotateAnimation.repeatCount = Float.infinity
boxNode.addAnimation(rotateAnimation, forKey: "rotate")

//: [Next](@next)
