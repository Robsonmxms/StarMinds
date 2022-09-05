//
//  ViewController.swift
//  StarMinds
//
//  Created by Robson Lima Lopes on 05/09/22.
//

import UIKit

class ViewController: UIViewController {

    private var header = HeaderView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        applyViewCode()
        // Do any additional setup after loading the view.
    }
}

extension ViewController: ViewCodeConfiguration {
    func buildHierarchy() {
        view.addSubview(header)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            header.topAnchor.constraint(
                equalTo: view.topAnchor,
                constant: view.bounds.height*0.1
            ),
            header.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 20
            )

        ])
    }

    func configureViews() {
        header.titleLabel.text = "Ieda"
        header.titleDescription.text = "Acorda Pedrinho"
        header.translatesAutoresizingMaskIntoConstraints = false
    }
}
