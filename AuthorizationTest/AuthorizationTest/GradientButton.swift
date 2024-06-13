//
//  GradientButton.swift
//  AuthorizationTest
//
//  Created by Dinara on 13.06.2024.
//

import UIKit

final class GradientButton: UIButton {
    let gradient = CAGradientLayer()

    init(colors: [CGColor]) {
        super.init(frame: .zero)
        gradient.frame = bounds
        gradient.colors = colors
        layer.addSublayer(gradient)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        gradient.frame = bounds
    }
}
