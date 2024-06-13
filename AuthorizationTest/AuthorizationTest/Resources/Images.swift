//
//  Images.swift
//  AuthorizationTest
//
//  Created by Dinara on 13.06.2024.
//

import UIKit

protocol ImagesProtocol {
    var rawValue: String { get }
}

extension ImagesProtocol {
    var uiImage: UIImage? {
        guard let image = UIImage(named: rawValue) else {
            fatalError("Could not find image with name \(rawValue)")
        }
        return image
    }

    var systemImage: UIImage? {
        guard let image = UIImage(systemName: rawValue) else {
            fatalError("Could not find image with name \(rawValue)")
        }
        return image
    }
}

enum Images: String, ImagesProtocol {
    case icon = "icon"
}
