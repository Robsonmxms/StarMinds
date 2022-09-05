//
//  CALayerBackground.swift
//  StarMinds
//
//  Created by Robson Lima Lopes on 05/09/22.
//

import Foundation
import UIKit

extension CALayer {
    public func configureGradientBackground(_ colors:CGColor...) {
        let gradient = CAGradientLayer()
        let maxWidth = max(
            self.bounds.size.height,
            self.bounds.size.width
        )
        let squareFrame = CGRect(
            origin: self.bounds.origin,
            size: CGSize(width: maxWidth, height: maxWidth)
        )
        gradient.frame = squareFrame
        gradient.colors = colors
        self.insertSublayer(gradient, at:0)
    }
}
