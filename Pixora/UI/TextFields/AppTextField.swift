//
//  AppTextField.swift
//  Pixora
//
//  Created by Artem Khakimullin on 16.02.2026.
//

import UIKit

final class AppTextField: UITextField {
    private var textPadding: UIEdgeInsets = .zero
    
    convenience init(textPadding: UIEdgeInsets) {
        self.init(frame: .zero)
        self.textPadding = textPadding
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
}
