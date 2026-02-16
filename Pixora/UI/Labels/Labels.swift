//
//  Labels.swift
//  Pixora
//
//  Created by Artem Khakimullin on 15.02.2026.
//

import UIKit

extension UILabel {
    public static func simpleLabel(text: String) -> UILabel {
        let label = UILabel()
        label.font = .Roboto.regular(size: 16)
        label.text = text
        label.textColor = .trueBlack
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    public static func errorLabel(text: String) -> UILabel {
        let label = UILabel()
        label.font = .Roboto.bold(size: 14)
        label.text = text
        label.textColor = .errorTextColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
}
