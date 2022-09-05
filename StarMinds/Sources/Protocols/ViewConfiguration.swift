//
//  ViewConfiguration.swift
//  StarMinds
//
//  Created by Robson Lima Lopes on 05/09/22.
//

import Foundation

protocol ViewCodeConfiguration {
    func buildHierarchy()
    func setupConstraints()
    func configureViews()
}

extension ViewCodeConfiguration {
    func applyViewCode() {
        buildHierarchy()
        setupConstraints()
        configureViews()
    }
}
