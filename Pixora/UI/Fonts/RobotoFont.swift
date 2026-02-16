//
//  RobotoFont.swift
//  Pixora
//
//  Created by Artem Khakimullin on 15.02.2026.
//

import UIKit

extension UIFont {
    enum Roboto {
        public static func regular(size: CGFloat) -> UIFont? {
            UIFont(name: "Roboto-Regular", size: size)
        }
        
        public static func bold(size: CGFloat) -> UIFont? {
            UIFont(name: "Roboto-Bold", size: size)
        }
    }
}
