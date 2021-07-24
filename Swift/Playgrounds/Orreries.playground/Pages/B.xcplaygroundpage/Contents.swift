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
cameraNode.position = SCNVector3(x: 0, y: 0, z: 8)

let scene = SCNScene()
scene.rootNode.addChildNode(cameraNode)

sceneView.scene = scene

PlaygroundPage.current.liveView = sceneView

let box = SCNBox(width: 1, height: 1, length: 1, chamferRadius: 0)

let boxMaterial = SCNMaterial()
boxMaterial.diffuse.contents = "green"
boxMaterial.isDoubleSided = true

box.firstMaterial = boxMaterial

let boxAxis = SCNNode()
let boxNode = SCNNode(geometry: box)
boxNode.rotation = SCNVector4(0, 1, 0, CGFloat.pi/4)

boxAxis.addChildNode(boxNode)
scene.rootNode.addChildNode(boxAxis)

let rotateAnimation = CABasicAnimation(keyPath: "rotation.w")
rotateAnimation.duration = 10
rotateAnimation.toValue = 2 * Double.pi + Double.pi/4
rotateAnimation.repeatCount = Float.infinity
boxNode.addAnimation(rotateAnimation, forKey: "rotate")

let boxEarthCollar = SCNNode()
boxAxis.addChildNode(boxEarthCollar)

let earthRadius = SCNNode()
earthRadius.position = SCNVector3(x: 4, y: 0, z: 0)
earthRadius.name = "earth-radius"

let earthNode = SCNNode(geometry: box)

earthRadius.addChildNode(earthNode)
boxEarthCollar.addChildNode(earthRadius)

//: [Next](@next)
