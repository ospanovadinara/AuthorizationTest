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
    case black = "090615"
    case white = "FFFFFF"
    case purple01 = "9358F7"
    case purple02 = "7B78F2"
    case blue01 = "6197EE"
    case blue02 = "45B5E9"
    case cyan = "10D7E2"
}
