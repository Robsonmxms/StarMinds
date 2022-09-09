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
                constant: 55
            ),
            stack.centerXAnchor.constraint(
                equalTo: card.centerXAnchor
            ),
            stack.topAnchor.constraint(
                equalTo: starImage.bottomAnchor
            ),
            stack.widthAnchor.constraint(
                equalToConstant: UIScreen.main.bounds.width * 0.7 * 0.85
            )

        ])

    }

    func configureViews() {
        card.backgroundColor = UIColor(named: "CardBackground")
        card.clipsToBounds = true
        card.layer.cornerRadius = 20
        card.translatesAutoresizingMaskIntoConstraints = false

        starImage.contentMode = .scaleAspectFill
        starImage.translatesAutoresizingMaskIntoConstraints = false

        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.alignment = .center
        stack.spacing = 30
        stack.translatesAutoresizingMaskIntoConstraints = false

        titleLabel.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 2
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        descriptionLabel.font = UIFont.systemFont(ofSize: 22, weight: .medium)
        descriptionLabel.textAlignment = .center
        descriptionLabel.numberOfLines = 3
        descriptionLabel.lineBreakMode = .byTruncatingTail
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
    }

    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size

        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height

        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
        }

        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)

        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return newImage!
    }

    func configure(with starModel: StarModel) {
        let uiImage = UIImage(named: starModel.image)
        starImage.image = resizeImage(
            image: uiImage!,
            targetSize: CGSize(width: 300, height: 300)
        )
        titleLabel.text = starModel.name
        descriptionLabel.text = starModel.description
    }
}
