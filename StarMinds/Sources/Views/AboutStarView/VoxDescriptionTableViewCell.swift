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

    override init(
        style: UITableViewCell.CellStyle,
        reuseIdentifier: String?
    ) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .clear
        selectionStyle = .none
        applyViewCode()
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
        stack.addArrangedSubview(descriptionLabel)
        contentView.addSubview(stack)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: ScreenSize.height*0.08
            ),
            stack.widthAnchor.constraint(
                equalTo: contentView.widthAnchor,
                multiplier: 0.9
            ),
            stack.centerXAnchor.constraint(
                equalTo: contentView.centerXAnchor
            ),
            stack.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor
            ),
            descriptionLabel.widthAnchor.constraint(
                equalTo: contentView.widthAnchor,
                multiplier: 0.8
            ),
            descriptionLabel.topAnchor.constraint(
                equalTo: stack.topAnchor,
                constant: ScreenSize.height*0.025
            ),
            descriptionLabel.bottomAnchor.constraint(
                equalTo: stack.bottomAnchor,
                constant: ScreenSize.height*0.025
            )
        ])
    }

    func configureViews() {

        stack.backgroundColor = UIColor(named: "SheetBackground")
        stack.clipsToBounds = true
        stack.layer.cornerRadius = 20
        stack.axis = .vertical
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false

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
