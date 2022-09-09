//
//  AboutStarViewController.swift
//  StarMinds
//
//  Created by Robson Lima Lopes on 09/09/22.
//

import UIKit
import Lottie

class AboutStarViewController: UIViewController {

    private var card = UIView()

    private lazy var starImage = UIImageView()

    private var stack = UIStackView()

    private var animationView: AnimationView = .init()

    private lazy var catImage = UIImageView()

    private lazy var baloonImage = UIImageView()

    private var catLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundColor()
        applyViewCode()

    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        updateColors()
    }

    private func updateColors() {
        setBackgroundColor()
    }

    private func setBackgroundColor() {
        view.layer.configureGradientBackground(
            UIColor(named: "UpGradient")!.cgColor,
            UIColor(named: "DownGradient")!.cgColor
        )
    }

}

extension AboutStarViewController: ViewCodeConfiguration {
    func buildHierarchy() {
        view.addSubview(animationView)

        stack.addSubview(card)
        stack.addSubview(starImage)

        view.addSubview(stack)
        view.addSubview(catImage)
        view.addSubview(baloonImage)
        view.addSubview(catLabel)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            animationView.topAnchor.constraint(
                equalTo: view.topAnchor
            ),
            animationView.heightAnchor.constraint(
                equalTo: view.heightAnchor,
                multiplier: 0.8
            ),
            animationView.centerXAnchor.constraint(
                equalTo: view.centerXAnchor
            ),
            card.centerXAnchor.constraint(
                equalTo: view.centerXAnchor
            ),
            card.centerYAnchor.constraint(
                equalTo: view.centerYAnchor
            ),
            card.heightAnchor.constraint(
                equalTo: view.heightAnchor,
                multiplier: 0.5
            ),
            card.widthAnchor.constraint(
                equalTo: view.widthAnchor,
                multiplier: 0.7
            ),
            starImage.centerXAnchor.constraint(
                equalTo: card.centerXAnchor
            ),
            starImage.centerYAnchor.constraint(
                equalTo: card.topAnchor,
                constant: 40
            ),
            starImage.heightAnchor.constraint(
                equalTo: card.heightAnchor,
                multiplier: 0.7
            ),
            starImage.widthAnchor.constraint(
                equalTo: card.widthAnchor,
                multiplier: 0.8
            ),

            catImage.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: -60
            ),

            catImage.bottomAnchor.constraint(
                equalTo: view.bottomAnchor
            ),
            catImage.heightAnchor.constraint(
                equalTo: view.heightAnchor,
                multiplier: 0.15
            ),
            catImage.widthAnchor.constraint(
                equalTo: view.widthAnchor,
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
                equalTo: view.centerXAnchor,
                constant: 5
            ),
            catLabel.centerYAnchor.constraint(
                equalTo: catImage.centerYAnchor,
                constant: -110
            )
        ])

    }

    func configureViews() {
        card.backgroundColor = .red
        card.clipsToBounds = true
        card.layer.cornerRadius = 20
        card.translatesAutoresizingMaskIntoConstraints = false

        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.animation = Animation.named("89151-stars")
        animationView.loopMode = .loop
        animationView.play()

        starImage.image = UIImage(named: "star3.png")
        starImage.contentMode = .scaleAspectFill
        starImage.isUserInteractionEnabled = true
        starImage.translatesAutoresizingMaskIntoConstraints = false

        stack.translatesAutoresizingMaskIntoConstraints = false

        catImage.image = UIImage(named: "cat.png")
        catImage.contentMode = .scaleAspectFill
        catImage.translatesAutoresizingMaskIntoConstraints = false

        baloonImage.image = UIImage(named: "baloon.png")
        baloonImage.contentMode = .scaleAspectFill
        baloonImage.translatesAutoresizingMaskIntoConstraints = false

        catLabel.text = "Olhe!"
        catLabel.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        catLabel.textColor = .black
        catLabel.translatesAutoresizingMaskIntoConstraints = false

    }
}
