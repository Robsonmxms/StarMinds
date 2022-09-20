//
//  AboutStarViewController.swift
//  StarMinds
//
//  Created by Robson Lima Lopes on 09/09/22.
//

import UIKit
import SceneKit

class AboutStarViewController: UITableViewController {
    private var closeIcon = UIImage()
    private var closeButton = UIBarButtonItem()
    private var star: Star
    private var stack = UIStackView()
    private var voxelView: StarView
    private var descriptionLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "CardBackground")
        applyViewCode()
    }

    init(with star: Star) {
        self.star = star
        self.voxelView = StarView(star: star)
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension AboutStarViewController: ViewCodeConfiguration {
    func buildHierarchy() {
        stack.addArrangedSubview(voxelView)
        stack.addArrangedSubview(descriptionLabel)
        view.addSubview(stack)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([

            stack.topAnchor.constraint(
                equalTo: view.topAnchor,
                constant: ScreenSize.height*0.1
            ),
            stack.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor
            ),
            stack.widthAnchor.constraint(
                equalTo: view.widthAnchor,
                multiplier: 0.9
            ),
            stack.centerXAnchor.constraint(
                equalTo: view.centerXAnchor
            )
        ])
    }

    func configureViews() {
        closeIcon = (UIImage(systemName: "xmark.circle.fill")?
            .withTintColor(
                UIColor(named: "AccentColor")!,
                renderingMode: .alwaysOriginal)
        )!

        closeButton = UIBarButtonItem(
            image: closeIcon,
            style: .done,
            target: self,
            action: #selector(close)
        )
        navigationItem.rightBarButtonItem = closeButton
        navigationItem.title = star.info.name.rawValue
        navigationController?.interactivePopGestureRecognizer?.delegate = self

        stack.axis = .vertical
        stack.distribution = .equalSpacing
        stack.alignment = .center
        stack.spacing = ScreenSize.height*0.03
        stack.translatesAutoresizingMaskIntoConstraints = false

        descriptionLabel.text = star.info.description
        descriptionLabel.font = UIFont.systemFont(
            ofSize: ScreenSize.width*0.056,
            weight: .medium
        )
        descriptionLabel.textAlignment = .center
        descriptionLabel.numberOfLines = .max
        descriptionLabel.lineBreakMode = .byTruncatingTail

    }

    @objc func close() {
        self.dismiss(animated: true)
    }

}

extension AboutStarViewController: UIGestureRecognizerDelegate {

}
