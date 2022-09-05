//
//  ViewController.swift
//  StarMinds
//
//  Created by Robson Lima Lopes on 05/09/22.
//

import UIKit

class ExploreViewController: UIViewController {

    private var header = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.layer.configureGradientBackground(
            UIColor(named: "UpGradient")!.cgColor,
            UIColor(named: "DownGradient")!.cgColor
        )
    }
}

extension ExploreViewController: ViewCodeConfiguration {
    func buildHierarchy() {

    }

    func setupConstraints() {

    }

    func configureViews() {

    }
}
