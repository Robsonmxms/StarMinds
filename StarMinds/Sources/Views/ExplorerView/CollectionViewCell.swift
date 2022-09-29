//
//  CollectionViewCell.swift
//  StarMinds
//
//  Created by Robson Lima Lopes on 06/09/22.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    private var stack = UIStackView()

    private var card = UIView()

    private var starImage = UIImageView()

    private var titleLabel = UILabel()

    private var descriptionLabel = UILabel()

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
        self.contentView.addSubview(card)
        self.contentView.addSubview(starImage)

        stack.addArrangedSubview(titleLabel)
        stack.addArrangedSubview(descriptionLabel)
        self.contentView.addSubview(stack)
    }

    func setupConstraints() {

        NSLayoutConstraint.activate([

            card.heightAnchor.constraint(
                equalTo: self.contentView.heightAnchor,
                multiplier: 0.9
            ),
            card.widthAnchor.constraint(
                equalTo: self.contentView.widthAnchor
            ),
            card.bottomAnchor.constraint(
                equalTo: self.contentView.bottomAnchor
            ),
            starImage.centerXAnchor.constraint(
                equalTo: card.centerXAnchor
            ),
            starImage.centerYAnchor.constraint(
                equalTo: card.topAnchor,
                constant: ScreenSize.width*0.05
            ),
            stack.centerXAnchor.constraint(
                equalTo: card.centerXAnchor
            ),
            stack.topAnchor.constraint(
                equalTo: card.centerYAnchor,
                constant: -ScreenSize.height*0.03
            ),
            stack.widthAnchor.constraint(
                equalToConstant: ScreenSize.width * 0.7 * 0.85
            )

        ])

    }

    func configureViews() {
        card.backgroundColor = UIColor(named: "CardBackground")
        card.clipsToBounds = true
        card.layer.cornerRadius = ScreenSize.width*0.05
        card.translatesAutoresizingMaskIntoConstraints = false

        starImage.contentMode = .scaleAspectFill
        starImage.isAccessibilityElement = true
        starImage.addParallax(30)
        starImage.translatesAutoresizingMaskIntoConstraints = false

        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.alignment = .center
        stack.spacing = ScreenSize.height*0.035
        stack.translatesAutoresizingMaskIntoConstraints = false

        titleLabel.font = UIFont.systemFont(
            ofSize: ScreenSize.width*0.08,
            weight: .bold
        )
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 2
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        descriptionLabel.font = UIFont.systemFont(
            ofSize: ScreenSize.width*0.056,
            weight: .medium
        )
        descriptionLabel.textAlignment = .center
        descriptionLabel.numberOfLines = 3
        descriptionLabel.lineBreakMode = .byTruncatingTail
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
    }

    func configure(with star: Star) {
        guard let uiImage = UIImage(named: star.image.path) else {
            fatalError("Could not load image")
        }
        let size: CGSize = StarModel.getSize(star.info.name)
        starImage.image = uiImage.resizeImage(
            size
        )
        starImage.accessibilityLabel = star.image.voiceDescription
        titleLabel.text = star.info.name.rawValue
        descriptionLabel.text = star.info.description
    }
}
