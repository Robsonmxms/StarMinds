//
//  HeaderView.swift
//  StarMinds
//
//  Created by Robson Lima Lopes on 05/09/22.
//

import UIKit

class HeaderView: UIView {

    var titleLabel = UILabel()

    var titleDescription = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        applyViewCode()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension HeaderView: ViewCodeConfiguration {
    func buildHierarchy() {
        self.addSubview(titleLabel)
        self.addSubview(titleDescription)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(
                equalTo: self.topAnchor
            ),
            titleLabel.leadingAnchor.constraint(
                equalTo: self.leadingAnchor
            ),
            titleDescription.topAnchor.constraint(
                equalTo: titleLabel.bottomAnchor,
                constant: 20
            ),
            titleDescription.leadingAnchor.constraint(
                equalTo: titleLabel.leadingAnchor)

        ])
    }

    func configureViews() {
        titleLabel.text = "Olá, mundo!"
        titleLabel.textColor = .black
        titleLabel.font = UIFont.systemFont(ofSize: 28, weight: .semibold)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        titleDescription.text = "Essa é a minha descrição"
        titleDescription.textColor = .black
        titleDescription.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        titleDescription.translatesAutoresizingMaskIntoConstraints = false
    }

}
