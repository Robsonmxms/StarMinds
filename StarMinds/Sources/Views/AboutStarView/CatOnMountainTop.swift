//
//  CatOnMountainTop.swift
//  StarMinds
//
//  Created by Ieda Xavier on 28/09/22.
//

import UIKit

class CatOnMountainTop: UIView {

    private var catImageView = UIImageView()

    private var rocketImageView = UIImageView()

    private var stack = UIStackView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        applyViewCode()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension CatOnMountainTop: ViewCodeConfiguration {
    func buildHierarchy() {
        stack.addArrangedSubview(catImageView)
        stack.addArrangedSubview(rocketImageView)
        self.addSubview(stack)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(
                equalTo: self.topAnchor
            ),
            stack.widthAnchor.constraint(
                equalTo: self.widthAnchor
            ),
            stack.centerXAnchor.constraint(
                equalTo: self.centerXAnchor
            ),
            stack.bottomAnchor.constraint(
                equalTo: self.bottomAnchor
            ),

        ])
    }

    func configureViews() {
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.alignment = .bottom
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false

        catImageView.contentMode = .scaleAspectFill
        catImageView.translatesAutoresizingMaskIntoConstraints = false
        guard let uiImage = UIImage(named: "catMountain.png") else {
            fatalError("Could not load image")
        }
        let catSize: CGSize = CGSize(
            width: ScreenSize.width*0.1,
            height: ScreenSize.height*0.06
        )
        catImageView.image = uiImage.resizeImage(catSize)

        rocketImageView.contentMode = .scaleAspectFill
        rocketImageView.translatesAutoresizingMaskIntoConstraints = false
        guard let image = UIImage(named: "rocket.png") else {
            fatalError("Could not load image")
        }
        let rocketSize: CGSize = CGSize(
            width: ScreenSize.width*0.15,
            height: ScreenSize.height*0.09
        )
        rocketImageView.image = image.resizeImage(
            rocketSize
        )
        
    }


}
