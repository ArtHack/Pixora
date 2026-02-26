//
//  MainViewController.swift
//  Pixora
//
//  Created by Artem Khakimullin on 08.02.2026.
//

import UIKit

class MainViewController: UITabBarController {
    
    private let childTabs: [UIViewController]
    
    init(childControllers: [UIViewController]) {
        self.childTabs = childControllers
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = childTabs
        view.backgroundColor = .yellow
    }
}
