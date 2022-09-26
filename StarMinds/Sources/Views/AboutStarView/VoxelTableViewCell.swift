//
//  VoxelView.swift
//  StarMinds
//
//  Created by Robson Lima Lopes on 15/09/22.
//

import UIKit
import SceneKit

class VoxelTableViewCell: UITableViewCell {

    var starView = StarView()
    private var star: Star = StarModel.mockStar()

    override init(
        style: UITableViewCell.CellStyle,
        reuseIdentifier: String?
    ) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        self.backgroundColor = .clear
        applyViewCode()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with star: Star) {
        starView.configure(with: star)
    }

}

extension VoxelTableViewCell: ViewCodeConfiguration {
    func buildHierarchy() {
        contentView.addSubview(starView)
    }
    func setupConstraints() {
        NSLayoutConstraint.activate([
            starView.topAnchor.constraint(
                equalTo: contentView.topAnchor
            ),
            starView.heightAnchor.constraint(
                equalToConstant: 0.4*ScreenSize.height
            ),
            starView.widthAnchor.constraint(
                equalTo: contentView.widthAnchor
            ),
            starView.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor
            )
        ])
    }

    func configureViews() {
        starView.translatesAutoresizingMaskIntoConstraints = false
    }
}

class MySet: SCNScene, SCNSceneRendererDelegate {

}

class StarView: SCNView{


    init() {
        super.init (frame: .zero, options: [:])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with star: Star) {

        let scene = MySet()

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
        scene.rootNode.addChildNode(buildFirstNode(star.voxNode[0]))
        scene.rootNode.addChildNode(buildSecondNode(star.voxNode[1]))
        scene.rootNode.addChildNode(buildThirdNode(star.voxNode[2]))

        scene.rootNode.position = SCNVector3Make(0, 5, -10)
        scene.rootNode.eulerAngles = SCNVector3(110.toRadian(), 180.toRadian(),0.toRadian())

        self.scene = scene

        self.showsStatistics = false
        self.allowsCameraControl = true
        self.backgroundColor = .clear

        self.translatesAutoresizingMaskIntoConstraints = false

        self.autoenablesDefaultLighting = true
        self.translatesAutoresizingMaskIntoConstraints = false

        let cameraNode = SCNNode()
        let camera = SCNCamera()// the camera
        camera.usesOrthographicProjection = true
        camera.orthographicScale = 3


        cameraNode.camera = camera

        cameraNode.position = SCNVector3(x: -0.18155792, y: 4.0028123, z: 0.537899)
        cameraNode.rotation = SCNVector4(x: -0.99604034, y: 0.05200568, z: 0.009337218, w: 0.3557861)
        cameraNode.eulerAngles = SCNVector3(x: -0.35529917, y: -0.018700039, z: 4.657428e-10)

        self.pointOfView = cameraNode
    }

    private func buildFirstNode(_ voxel: VoxNode) -> SCNNode {

        let material = SCNMaterial()
        material.diffuse.contents = buildColor(color: voxel.color)
        material.emission.contents = buildColor(color: voxel.color)
        material.roughness.contents = buildColor(color: voxel.color)
        material.emission.intensity = 0.5



        let scene = SCNScene(named: voxel.scene)!
        let node = scene.rootNode.childNodes[0]

        node.scale = SCNVector3(x: 0.999, y: 0.999, z: 0.9999 )
        node.position = SCNVector3(x: 0, y: 0, z: 3)

        node.geometry?.firstMaterial = material

        let rotate = SCNAction.rotate(by: CGFloat(10.toRadian()), around: SCNVector3(x: 0, y: 0, z: -0.3), duration: 1)


        let loop = SCNAction.repeatForever(rotate)
        node.runAction(loop)

        return node

    }

    private func buildSecondNode(_ voxel: VoxNode) -> SCNNode {

        let material = SCNMaterial()
        material.diffuse.contents = buildColor(color: voxel.color)
        material.emission.contents =  buildColor(color: voxel.color)

        let scene = SCNScene(named: voxel.scene)!
        let node = scene.rootNode.childNodes[0]

        node.scale = SCNVector3(x: 0.999, y: 0.999, z: 0.999 )
        node.position = SCNVector3(x: 0, y: 0, z: 3)

        node.geometry?.firstMaterial = material

        let rotate = SCNAction.rotate(by: CGFloat(10.toRadian()), around: SCNVector3(x: 0, y: 0, z: -0.3), duration: 1)


        let loop = SCNAction.repeatForever(rotate)
        node.runAction(loop)

        return node

    }

    private func buildThirdNode(_ voxel: VoxNode) -> SCNNode {

        let material = SCNMaterial()
        material.diffuse.contents = buildColor(color: voxel.color)
        material.lightingModel = .phong
        material.transparency = 0.3

        let scene = SCNScene(named: voxel.scene)!
        let node = scene.rootNode.childNodes[0]

        node.scale = SCNVector3(x: 0.999, y: 0.999, z: 0.999 )
        node.position = SCNVector3(x: 0, y: 0, z: 3)

        node.geometry?.firstMaterial = material

        let rotate = SCNAction.rotate(by: CGFloat(10.toRadian()), around: SCNVector3(x: 0, y: 0, z: -0.3), duration: 1)


        let loop = SCNAction.repeatForever(rotate)
        node.runAction(loop)

        return node

    }

    private func buildColor(color: StarColor) -> UIColor {
        return UIColor(
            red: color.red/255,
            green: color.green/255,
            blue: color.blue/255,
            alpha: 1
        )
    }

}

extension Int {
    func toRadian() -> Float {
        return Float(self) * Float.pi/180
    }
}
