//
//  VoxelView.swift
//  StarMinds
//
//  Created by Robson Lima Lopes on 15/09/22.
//

import UIKit
import SceneKit

class VoxelView: UIView, SCNPhysicsContactDelegate, SCNSceneRendererDelegate {
    private var star: Star?

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
