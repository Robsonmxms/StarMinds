//
//  ViewController.swift
//  StarMinds
//
//  Created by Robson Lima Lopes on 05/09/22.
//

import UIKit
import Lottie

class ExploreViewController: UIViewController {

    private var animationView: AnimationView = .init()

    private var catTalksView: CatTalksView = CatTalksView()

    private var collectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = .horizontal
        collectionViewLayout.estimatedItemSize = CGSize(
            width: UIScreen.main.bounds.width * 0.7,
            height: UIScreen.main.bounds.height * 0.52
        )
        return UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
    }()

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

extension ExploreViewController: ViewCodeConfiguration {
    func buildHierarchy() {
        view.addSubview(animationView)
        view.addSubview(catTalksView)
        view.addSubview(collectionView)
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
            collectionView.centerXAnchor.constraint(
                equalTo: view.centerXAnchor
            ),
            collectionView.centerYAnchor.constraint(
                equalTo: view.centerYAnchor,
                constant: -20
            ),
            collectionView.widthAnchor.constraint(
                equalTo: view.widthAnchor,
                multiplier: 0.95
            ),
            collectionView.heightAnchor.constraint(
                equalTo: view.heightAnchor,
                multiplier: 0.53
            ),
            catTalksView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor
            ),
            catTalksView.bottomAnchor.constraint(
                equalTo: view.bottomAnchor
            ),
            catTalksView.heightAnchor.constraint(
                equalTo: view.heightAnchor,
                multiplier: 0.15
            ),
            catTalksView.widthAnchor.constraint(
                equalTo: view.widthAnchor
            )
        ])
    }

    func configureViews() {
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.animation = Animation.named("89151-stars")
        animationView.loopMode = .loop
        animationView.play()

        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        catTalksView.translatesAutoresizingMaskIntoConstraints = false

    }
}

extension ExploreViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return 8
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView
            .dequeueReusableCell(
                withReuseIdentifier: "cell",
                for: indexPath
            ) as? CollectionViewCell else {
            fatalError("DequeueReusableCell failed while casting")
        }

        return cell
    }

}
