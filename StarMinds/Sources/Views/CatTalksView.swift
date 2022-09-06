//
//  CatTalksView.swift
//  StarMinds
//
//  Created by Robson Lima Lopes on 06/09/22.
//

import UIKit

class CatTalksView: UIView {

    private var catImage = UIImageView()
    private var baloonImage = UIImageView()
    private var catLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        applyViewCode()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension CatTalksView: ViewCodeConfiguration {
    func buildHierarchy() {
        self.addSubview(catImage)
        self.addSubview(baloonImage)
        self.addSubview(catLabel)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            catImage.leadingAnchor.constraint(
                equalTo: self.leadingAnchor,
                constant: -UIScreen.main.bounds.width*0.10
            ),
            catImage.bottomAnchor.constraint(
                equalTo: self.bottomAnchor,
                constant: 10
            ),
            catImage.heightAnchor.constraint(
                equalTo: self.heightAnchor
            ),
            catImage.widthAnchor.constraint(
                equalTo: self.widthAnchor,
                multiplier: 0.7
            ),
            baloonImage.bottomAnchor.constraint(
                equalTo: catImage.centerYAnchor,
                constant: 120
            ),
            baloonImage.leadingAnchor.constraint(
                equalTo: catImage.centerXAnchor,
                constant: -70
            ),
            baloonImage.heightAnchor.constraint(
                equalTo: catImage.heightAnchor,
                multiplier: 2.5
            ),
            baloonImage.widthAnchor.constraint(
                equalTo: catImage.widthAnchor,
                multiplier: 1.5
            ),
            catLabel.centerXAnchor.constraint(
                equalTo: baloonImage.centerXAnchor,
                constant: -12
            ),
            catLabel.centerYAnchor.constraint(
                equalTo: baloonImage.centerYAnchor,
                constant: -42
            ),
            catLabel.widthAnchor.constraint(
                equalTo: baloonImage.widthAnchor,
                multiplier: 0.3
            ),
            catLabel.heightAnchor.constraint(
                equalTo: baloonImage.heightAnchor,
                multiplier: 0.25
            )
        ])
    }

    func configureViews() {
        catImage.image = UIImage(named: "CatBigEyes.png")
        catImage.contentMode = .scaleAspectFill
        catImage.translatesAutoresizingMaskIntoConstraints = false

        baloonImage.image = UIImage(named: "Baloon.png")
        baloonImage.contentMode = .scaleAspectFill
        baloonImage.translatesAutoresizingMaskIntoConstraints = false

        catLabel.text = "Olhe! Temos estrelas aqui"
        catLabel.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        catLabel.textColor = .black
        catLabel.numberOfLines = 2
        catLabel.lineBreakMode = .byWordWrapping
        catLabel.textAlignment = .center
        catLabel.translatesAutoresizingMaskIntoConstraints = false
    }

}
