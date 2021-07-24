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
cameraNode.position = SCNVector3(x: 0, y: 0, z: 16)

let scene = SCNScene()
scene.rootNode.addChildNode(cameraNode)

sceneView.scene = scene

PlaygroundPage.current.liveView = sceneView

let sun = SCNSphere(radius: 2)

let sunMaterial = SCNMaterial()
sunMaterial.diffuse.contents = "sun.jpg"

sun.firstMaterial = sunMaterial

let sunAxis = SCNNode()
let sunNode = SCNNode(geometry: sun)

sunAxis.addChildNode(sunNode)

scene.rootNode.addChildNode(sunAxis)

let sunSpinAnimation = CABasicAnimation(keyPath: "rotation")
sunSpinAnimation.duration = 60
sunSpinAnimation.toValue = NSValue(scnVector4: SCNVector4(x: 0, y: 1, z: 0, w: CGFloat.pi * 2))
sunSpinAnimation.repeatCount = Float.infinity
sunNode.addAnimation(sunSpinAnimation, forKey: "sun spin")

let sunEarthCollar = SCNNode()
sunAxis.addChildNode(sunEarthCollar)

let sunEarthRadius = SCNNode()
sunEarthRadius.position = SCNVector3(x: 8, y: 0, z: 0)
sunEarthRadius.name = "earth-radius"

let earthMaterial = sunMaterial.copy() as! SCNMaterial
earthMaterial.diffuse.contents = "earth.jpg"

let earth = SCNSphere(radius: 0.5)
earth.firstMaterial = earthMaterial

let earthAxis = SCNNode()
let earthNode = SCNNode(geometry: earth)

earthAxis.addChildNode(earthNode)
sunEarthRadius.addChildNode(earthAxis)
sunEarthCollar.addChildNode(sunEarthRadius)

let sunEarthOrbit = CABasicAnimation(keyPath: "rotation")
sunEarthOrbit.duration = 20
sunEarthOrbit.toValue =  NSValue(scnVector4: SCNVector4(x: 0, y: 1, z: 0, w: CGFloat.pi * 2))
sunEarthOrbit.repeatCount = Float.infinity

sunEarthCollar.addAnimation(sunEarthOrbit, forKey: "earth orbit")

var earthSpinAnimation = CABasicAnimation(keyPath: "rotation")
earthSpinAnimation.duration = 1
earthSpinAnimation.toValue =  NSValue(scnVector4: SCNVector4(x: 0, y: 1, z: 0, w: CGFloat.pi * 2))
earthSpinAnimation.repeatCount = Float.infinity
earthNode.addAnimation(earthSpinAnimation, forKey: "earth spin")

let earthMoonCollar = SCNNode()
earthAxis.addChildNode(earthMoonCollar)

let earthMoonRadius = SCNNode()
earthMoonRadius.position = SCNVector3(x: 2, y: 0, z: 0)

let moonMaterial = sunMaterial.copy() as! SCNMaterial
moonMaterial.diffuse.contents = "moon.jpg"

let moon = SCNSphere(radius: 0.2)
moon.firstMaterial = moonMaterial

let moonAxis = SCNNode()
let moonNode = SCNNode(geometry: moon)

moonAxis.addChildNode(moonNode)
earthMoonRadius.addChildNode(moonAxis)
earthMoonCollar.addChildNode(earthMoonRadius)

let earthMoonOrbit = CABasicAnimation(keyPath: "rotation")
earthMoonOrbit.duration = 5
earthMoonOrbit.toValue =  NSValue(scnVector4: SCNVector4(x: 0, y: 1, z: 0, w: CGFloat.pi * 2))
earthMoonOrbit.repeatCount = Float.infinity

earthMoonCollar.addAnimation(earthMoonOrbit, forKey: "moon orbit")


//: [Next](@next)
