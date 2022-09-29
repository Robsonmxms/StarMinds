//
//  VoxDescriptionTableViewCell.swift
//  StarMinds
//
//  Created by Ieda Xavier on 21/09/22.
//

import UIKit

class VoxDescriptionTableViewCell: UITableViewCell {

    private var stack = UIStackView()

    private var descriptionLabel = UILabel()

    private var catOnMountainTop = CatOnMountainTop()

    override init(
        style: UITableViewCell.CellStyle,
        reuseIdentifier: String?
    ) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        selectionStyle = .none
        applyViewCode()
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        stack.roundCorners(
            [.topLeft,.topRight],
            radius: ScreenSize.width
        )
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with star: Star) {
        descriptionLabel.text = star.info.description
    }

}

extension VoxDescriptionTableViewCell: ViewCodeConfiguration {
    func buildHierarchy() {
        contentView.addSubview(catOnMountainTop)
        stack.addArrangedSubview(descriptionLabel)
        contentView.addSubview(stack)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: 100
            ),
            stack.widthAnchor.constraint(
                equalTo: contentView.widthAnchor,
                constant: ScreenSize.width*0.25
            ),
            stack.centerXAnchor.constraint(
                equalTo: contentView.centerXAnchor
            ),
            stack.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor
            ),
            catOnMountainTop.bottomAnchor.constraint(
                equalTo: stack.topAnchor,
                constant: ScreenSize.height*0.005
            ),
            catOnMountainTop.centerXAnchor.constraint(
                equalTo: stack.centerXAnchor
            ),
            descriptionLabel.widthAnchor.constraint(
                equalTo: contentView.widthAnchor,
                multiplier: 0.8
            ),
            descriptionLabel.topAnchor.constraint(
                equalTo: stack.topAnchor,
                constant: ScreenSize.height*0.1
            ),
            descriptionLabel.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: -ScreenSize.height*0.06
            )
        ])
    }

    func configureViews() {
        print(contentView.bounds.width)
        stack.backgroundColor = UIColor(named: "SheetBackground")
        stack.clipsToBounds = true
        stack.axis = .vertical
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false

        catOnMountainTop.translatesAutoresizingMaskIntoConstraints = false

        descriptionLabel.font = UIFont.systemFont(
            ofSize: ScreenSize.width*0.056,
            weight: .medium
        )
        descriptionLabel.textAlignment = .left
        descriptionLabel.numberOfLines = .max
        descriptionLabel.lineBreakMode = .byTruncatingTail
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
    }

}
