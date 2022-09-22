//
//  VoxDescriptionTableViewCell.swift
//  StarMinds
//
//  Created by Ieda Xavier on 21/09/22.
//

import UIKit

class VoxDescriptionTableViewCell: UITableViewCell {

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
        contentView.addSubview(descriptionLabel)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: ScreenSize.height*0.08
            ),
            descriptionLabel.widthAnchor.constraint(
                equalTo: contentView.widthAnchor,
                multiplier: 0.9
            ),
            descriptionLabel.centerXAnchor.constraint(
                equalTo: contentView.centerXAnchor
            ),
            descriptionLabel.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor
            )
        ])
    }

    func configureViews() {

        descriptionLabel.font = UIFont.systemFont(
            ofSize: ScreenSize.width*0.056,
            weight: .medium
        )
        descriptionLabel.textAlignment = .center
        descriptionLabel.numberOfLines = .max
        descriptionLabel.lineBreakMode = .byTruncatingTail
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
    }

    
}
