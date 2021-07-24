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

let sunAxis = SCNNode()
let sunNode = SCNNode(geometry: box)
sunNode.rotation = SCNVector4(0, 1, 0, CGFloat.pi/4)

sunAxis.addChildNode(sunNode)

scene.rootNode.addChildNode(sunAxis)

let sunSpinAnimation = CABasicAnimation(keyPath: "rotation.w")
sunSpinAnimation.duration = 10
sunSpinAnimation.toValue = 2 * Double.pi + Double.pi/4
sunSpinAnimation.repeatCount = Float.infinity
sunNode.addAnimation(sunSpinAnimation, forKey: "sun spin")

let sunEarthCollar = SCNNode()
sunAxis.addChildNode(sunEarthCollar)

let sunEarthRadius = SCNNode()
sunEarthRadius.position = SCNVector3(x: 4, y: 0, z: 0)
sunEarthRadius.name = "earth-radius"

let earthNode = SCNNode(geometry: box)

sunEarthRadius.addChildNode(earthNode)
sunEarthCollar.addChildNode(sunEarthRadius)

let sunEarthOrbit = CABasicAnimation(keyPath: "rotation")
sunEarthOrbit.duration = 20
sunEarthOrbit.toValue =  NSValue(scnVector4: SCNVector4(x: 0, y: 1, z: 0, w: CGFloat.pi * 2))
sunEarthOrbit.repeatCount = Float.infinity

sunEarthCollar.addAnimation(sunEarthOrbit, forKey: "earth orbit")

var earthSpinAnimation = CABasicAnimation(keyPath: "rotation")
earthSpinAnimation.duration = 5
earthSpinAnimation.toValue =  NSValue(scnVector4: SCNVector4(x: 0, y: 1, z: 0, w: CGFloat.pi * 2))
earthSpinAnimation.repeatCount = Float.infinity
earthNode.addAnimation(earthSpinAnimation, forKey: "earth spin")

//: [Next](@next)
