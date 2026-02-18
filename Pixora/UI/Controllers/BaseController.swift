//
//  BaseController.swift
//  Pixora
//
//  Created by Artem Khakimullin on 17.02.2026.
//

import UIKit

class BaseController: UIViewController {
    
    func showDIError() {
        showErrorAlert(title: "DI Error!")
    }
    
    func showErrorAlert(title: String, message: String? = nil) {
        
        guard !(presentedViewController is UIAlertController) else { return }
        
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        
        present(alert, animated: true)
    }
}
