//: [Previous](@previous)

import SceneKit
import PlaygroundSupport

let rect = CGRect(x: 0, y: 0, width: 700, height: 800)

let sceneView = SCNView(frame: rect)
sceneView.autoenablesDefaultLighting = true
sceneView.allowsCameraControl = true
sceneView.backgroundColor = .black

let camera = SCNCamera()
camera.automaticallyAdjustsZRange = true
let cameraNode = SCNNode()
cameraNode.camera = camera
cameraNode.rotation = SCNVector4(x: 1, y: 0, z: 0, w: -CGFloat.pi/4)

let cameraRadius = SCNNode()
cameraRadius.position = SCNVector3(x: 0, y: 70, z: 0)

let cameraAxis = SCNNode()
cameraAxis.position = SCNVector3(x: 0, y: 0, z: 70)

cameraRadius.addChildNode(cameraAxis)
cameraAxis.addChildNode(cameraNode)

let scene = SCNScene()
scene.rootNode.addChildNode(cameraRadius)

sceneView.scene = scene

PlaygroundPage.current.liveView = sceneView


let system = System()
scene.rootNode.addChildNode(system.axis)

var planet = Planet(withName: "Mercury", ofRadius: 1, atDistance: 10, usingImage: "mercury.jpg", orColor: nil, withDay: 60, orbitalTime: 8)

system.addPlanet(planet: planet)

planet = Planet(withName: "Venus", ofRadius: 2.2, atDistance: 15, usingImage: "venus.jpg", orColor: nil, withDay: 10, orbitalTime: 12)

system.addPlanet(planet: planet)

planet = Planet(withName: "Earth", ofRadius: 3, atDistance: 30, usingImage: "earth.jpg", orColor: nil, withDay: 10, orbitalTime: 20)

var moon = Moon(ofRadius: 0.75, atDistance: 8, usingImage: "moon.jpg", orColor: nil, orbitalTime: 5)

planet.addMoon(moon: moon)

system.addPlanet(planet: planet)

planet = Planet(withName: "Mars", ofRadius: 2, atDistance: 37, usingImage: "mars.jpg", orColor: nil, withDay: 10, orbitalTime: 30)

system.addPlanet(planet: planet)

planet = Planet(withName: "Jupiter", ofRadius: 7, atDistance: 50, usingImage: "jupiter.jpg", orColor: nil, withDay: 10, orbitalTime: 50)

system.addPlanet(planet: planet)

planet = Planet(withName: "Saturn", ofRadius: 6, atDistance: 65, usingImage: "saturn.jpg", orColor: nil, withDay: 10, orbitalTime: 65)

var ring = Ring(withInnerRadiusAt: 8, andOuterRadiusAt: 12, usingImge: "saturnring.jpg")

planet.addRing(ring: ring)

system.addPlanet(planet: planet)

planet = Planet(withName: "Neptune", ofRadius: 5, atDistance: 80, usingImage: "neptune.jpg", orColor: nil, withDay: 10, orbitalTime: 80)

system.addPlanet(planet: planet)

planet = Planet(withName: "Uranus", ofRadius: 5, atDistance: 95, usingImage: "uranus.jpg", orColor: nil, withDay: 10, orbitalTime: 95)

system.addPlanet(planet: planet)


//: [Next](@next)
