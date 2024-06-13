//
//  Colors.swift
//  AuthorizationTest
//
//  Created by Dinara on 13.06.2024.
//

import UIKit

// MARK: - ColorsProtocol
protocol ColorsProtocol {
    var rawValue: String { get }
}

extension ColorsProtocol {
    var uiColor: UIColor {
        UIColor.init(named: rawValue) ?? .white
    }

    var cgColor: CGColor {
        return uiColor.cgColor
    }
}

enum Colors: String, ColorsProtocol {
    case black = "0A0715"
    case white = "E8E8E8"
}
