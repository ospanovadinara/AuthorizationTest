//
//  Fonts.swift
//  AuthorizationTest
//
//  Created by Dinara on 13.06.2024.
//

import UIKit

// MARK: - FontsProtocol
protocol FontsProtocol {
    var rawValue: String { get }
}

// MARK: - Extension FontsProtocol
extension FontsProtocol {
    func s14() -> UIFont {
        return apply(size: 14)
    }

    func s16() -> UIFont {
        return apply(size: 16)
    }

    func s17() -> UIFont {
        return apply(size: 17)
    }

    func s19() -> UIFont {
        return apply(size: 19)
    }

    func s34() -> UIFont {
        return apply(size: 34)
    }
}

// MARK: - Extension FontsProtocol
extension FontsProtocol {
    private func apply(size value: CGFloat) -> UIFont {
        guard let font = UIFont.init(name: rawValue, size: value) else {
            fatalError("Could not find font with name \(rawValue)")
        }
        return font
    }
}

// MARK: - Enum Fonts
enum Fonts: String, FontsProtocol {
    case regular = "SFProDisplay-Regular"
    case medium = "SFProDisplay-Medium"
    case bold = "SFProDisplay-Bold"
}
