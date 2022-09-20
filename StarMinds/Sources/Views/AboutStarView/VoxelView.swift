//
//  VoxelView.swift
//  StarMinds
//
//  Created by Robson Lima Lopes on 15/09/22.
//

import UIKit
import SceneKit

class VoxelView: SCNView {
    private var star: Star?

//    private var starView = StarView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        applyViewCode()
    }

    convenience init(frame: CGRect, star: Star) {
        self.init(frame: frame)
        self.star = star
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension VoxelView: ViewCodeConfiguration {
    func buildHierarchy() {}
    func setupConstraints() {}
    func configureViews() {}
}

class MySet: SCNScene, SCNSceneRendererDelegate {

}

class StarView: SCNView {

    // Pesquisar o que é Lazy
    lazy var planetBase : SCNNode = {

        let material = SCNMaterial()
        material.diffuse.contents = UIColor(red: 130/255, green: 25/255, blue: 14/255, alpha: 1)
        material.emission.contents = UIColor(red: 130/255, green: 25/255, blue: 14/255, alpha: 1)
        material.roughness.contents = UIColor(red: 130/255, green: 25/255, blue: 14/255, alpha: 1)
        material.emission.intensity = 0.5



        let scene = SCNScene(named: "Anas_Marrons#82190e.dae")!
        let node = scene.rootNode.childNodes[0]

        node.scale = SCNVector3(x: 0.999, y: 0.999, z: 0.9999 )
        node.position = SCNVector3(x: 0, y: 0, z: 3)

        node.geometry?.firstMaterial = material



        return node

    }()

    lazy var planetSecondary : SCNNode = {

        let material = SCNMaterial()
        material.diffuse.contents = UIColor(red: 77/255, green: 8/255, blue: 5/255, alpha: 1)
        material.emission.contents =  UIColor(red: 77/255, green: 8/255, blue: 5/255, alpha: 1)

        let scene = SCNScene(named: "Anas_Marrons#4d0805.dae")!
        let node = scene.rootNode.childNodes[0]

        node.scale = SCNVector3(x: 0.999, y: 0.999, z: 0.999 )
        node.position = SCNVector3(x: 0, y: 0, z: 3)

        node.geometry?.firstMaterial = material

        return node

    }()

    lazy var planetLight : SCNNode = {

        let material = SCNMaterial()
        material.diffuse.contents = UIColor(red: 183/255, green: 55/255, blue: 19/255, alpha: 1)
        material.lightingModel = .phong
        material.transparency = 0.3

        let scene = SCNScene(named: "Anas_Marrons#b73713.dae")!
        let node = scene.rootNode.childNodes[0]

        node.scale = SCNVector3(x: 0.999, y: 0.999, z: 0.999 )
        node.position = SCNVector3(x: 0, y: 0, z: 3)

        node.geometry?.firstMaterial = material

        return node

    }()

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init(star: Star) {
        super.init (frame: .zero, options: [:])

        let scene = MySet()

        //

        // Create and add a light to the scene:
        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light!.type = .directional
        lightNode.light?.intensity = 50
        lightNode.eulerAngles = SCNVector3(x: 10, y: 0, z: 3)
        scene.rootNode.addChildNode(lightNode)

        // Create and add an ambient light to the scene:
        let ambientLightNode = SCNNode()
        ambientLightNode.light = SCNLight()
        ambientLightNode.light!.type = .ambient

        ambientLightNode.light!.color = UIColor.white

        lightNode.position = SCNVector3(x: 10, y: 3, z: 6)
        lightNode.rotation = SCNVector4(x: -0.99604034, y: 0.07114126, z: 0.05331763, w: 1.2901226)
        lightNode.eulerAngles =  SCNVector3(x: -1.2863125, y: 0.106957085, z: 1.4986801e-08)

        ambientLightNode.position = SCNVector3(x: 10, y: 3, z: 6)
        ambientLightNode.rotation = SCNVector4(x: -0.99604034, y: 0.07114126, z: 0.05331763, w: 1.2901226)
        ambientLightNode.eulerAngles =  SCNVector3(x: -1.2863125, y: 0.106957085, z: 1.4986801e-08)

        scene.rootNode.addChildNode(ambientLightNode)
        scene.rootNode.addChildNode(lightNode)
        scene.rootNode.addChildNode(planetBase)
        scene.rootNode.addChildNode(planetSecondary)
        scene.rootNode.addChildNode(planetLight)

        scene.rootNode.position = SCNVector3Make(0, 9, -10)
        scene.rootNode.eulerAngles = SCNVector3(110.toRadian(), 180.toRadian(),0.toRadian())

        self.scene = scene

        self.showsStatistics = false
        self.allowsCameraControl = true
        self.backgroundColor = .white

        self.translatesAutoresizingMaskIntoConstraints = false

        self.autoenablesDefaultLighting = true
        self.translatesAutoresizingMaskIntoConstraints = false

        let cameraNode = SCNNode()
        let camera = SCNCamera()// the camera
        camera.usesOrthographicProjection = true
        camera.orthographicScale = 7

        cameraNode.camera = camera

        cameraNode.position = SCNVector3(x: -0.18155792, y: 4.0028123, z: 0.537899)
        cameraNode.rotation = SCNVector4(x: -0.99604034, y: 0.05200568, z: 0.009337218, w: 0.3557861)
        cameraNode.eulerAngles = SCNVector3(x: -0.35529917, y: -0.018700039, z: 4.657428e-10)

        self.pointOfView = cameraNode
    }
}

extension Int {
    func toRadian() -> Float {
        return Float(self) * Float.pi/180
    }
}
