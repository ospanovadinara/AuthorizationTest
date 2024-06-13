//
//  UIView.swift
//  AuthorizationTest
//
//  Created by Dinara on 13.06.2024.
//

import UIKit

extension UIView {
    func addGradientBorder(
            colors: [UIColor],
            width: CGFloat,
            startPoint: CGPoint = CGPoint(x: 0, y: 0.5),
            endPoint: CGPoint = CGPoint(x: 1, y: 0.5),
            cornerRadius: CGFloat = 16
    ) {
        let border = CAGradientLayer()
        border.frame = bounds
        border.colors = colors.map { $0.cgColor }
        border.startPoint = startPoint
        border.endPoint = endPoint

        let mask = CAShapeLayer()
        mask.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
        mask.fillColor = UIColor.clear.cgColor
        mask.strokeColor = UIColor.white.cgColor
        mask.lineWidth = width

        border.mask = mask
        layer.addSublayer(border)
    }
}
