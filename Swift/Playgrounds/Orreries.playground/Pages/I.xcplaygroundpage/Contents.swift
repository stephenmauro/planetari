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

//class Planet {
//     var name : String
//     var distance : Int
//
//     Planet(name, distance) {
//          this.name = name
//     }
// }

//let planetNames = ["Mercury", "Venus", "Earth", "Mars"]
//let planetDistances = [3, 4, 8, 11]
//let planetSpin = [20, 2, 1, 1]
//let planetImages = [""]


PlaygroundPage.current.liveView = sceneView

func generateAnimation(duration: CFTimeInterval) -> CABasicAnimation {
    let animation = CABasicAnimation(keyPath: "rotation")
    animation.duration = duration
    animation.toValue = NSValue(scnVector4: SCNVector4(x: 0, y: 1, z: 0, w: CGFloat.pi * 2))
    animation.repeatCount = Float.infinity
    return animation
}

let sun = SCNSphere(radius: 2)

let sunMaterial = SCNMaterial()
sunMaterial.diffuse.contents = "sun.jpg"

sun.firstMaterial = sunMaterial

let sunAxis = SCNNode()
let sunNode = SCNNode(geometry: sun)

sunAxis.addChildNode(sunNode)

scene.rootNode.addChildNode(sunAxis)

sunNode.addAnimation(generateAnimation(duration: 60), forKey: "sun spin")

let sunMercuryCollar = SCNNode()
sunAxis.addChildNode(sunMercuryCollar)

let sunMercuryRadius = SCNNode()
sunMercuryRadius.position = SCNVector3(x: 3, y: 0, z: 0)
sunMercuryRadius.name = "mercury-radius"

let mercuryMaterial = sunMaterial.copy() as! SCNMaterial
mercuryMaterial.diffuse.contents = "mercury.jpg"

let mercury = SCNSphere(radius: 0.2)
mercury.firstMaterial = mercuryMaterial

let mercuryAxis = SCNNode()
let mercuryNode = SCNNode(geometry: mercury)

mercuryAxis.addChildNode(mercuryNode)
sunMercuryRadius.addChildNode(mercuryAxis)
sunMercuryCollar.addChildNode(sunMercuryRadius)

sunMercuryCollar.addAnimation(generateAnimation(duration: 20), forKey: "mercury orbit")

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

sunEarthCollar.addAnimation(generateAnimation(duration: 20), forKey: "earth orbit")

earthNode.addAnimation(generateAnimation(duration: 1), forKey: "earth spin")

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

earthMoonCollar.addAnimation(generateAnimation(duration: 5), forKey: "moon orbit")

//: [Next](@next)
