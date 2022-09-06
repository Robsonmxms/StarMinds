//
//  CollectionViewCell.swift
//  StarMinds
//
//  Created by Robson Lima Lopes on 06/09/22.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    private var card = UIView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        applyViewCode()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CollectionViewCell: ViewCodeConfiguration {
    func buildHierarchy() {
        self.addSubview(card)
    }

    func setupConstraints() {

        NSLayoutConstraint.activate([
            card.heightAnchor.constraint(
                equalTo: self.heightAnchor
            ),
            card.widthAnchor.constraint(
                equalTo: self.widthAnchor
            )
        ])

    }

    func configureViews() {
        card.backgroundColor = UIColor(named: "CardBackground")
        card.clipsToBounds = true
        card.layer.cornerRadius = 20
        card.translatesAutoresizingMaskIntoConstraints = false
    }
}
