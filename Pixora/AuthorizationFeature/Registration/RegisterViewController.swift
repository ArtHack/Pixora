//
//  RegiserViewController.swift
//  Pixora
//
//  Created by Artem Khakimullin on 17.02.2026.
//

import UIKit
import SnapKit

class RegisterViewController: NavigationChildController {
    
    //MARK: - UIComponents
    
    private let loginLabel: UILabel = .simpleLabel(text: "Login")
    
    private let loginTextField: UITextField = {
        let textField: UITextField = .inputField()
        textField.placeholder = "Enter your login"
        textField.autocapitalizationType = .none
        return textField
    }()
    
    private let passwordLabel: UILabel = .simpleLabel(text: "Password")
    
    private let passwordTextField: UITextField = {
        let textField: UITextField = .inputField()
        textField.placeholder = "Enter your password"
        textField.autocapitalizationType = .none
        return textField
    }()
    
    private let registerButton: UIButton = .authButton(title: "Register")
    private let backButton: UIButton = .authButton(title: "Back")
    
    private let errorLabel: UILabel = .errorLabel(text: "Error!")
    
    private let loadingIndicator = UIActivityIndicatorView()
    
    var router: AuthRouterProtocol?

    //MARK: - Override
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupViews()
        setupConstraints()
    }
    
    //MARK: - Private Methods
    
    private func setupViews() {
        let subviews = [loginLabel, loginTextField, passwordLabel, passwordTextField,
                        registerButton, backButton, errorLabel, loadingIndicator]
        subviews.forEach { view.addSubview($0) }
        
        loadingIndicator.hidesWhenStopped = false
        loadingIndicator.color = .trueBlack
        loadingIndicator.style = .large
        
        backButton.addTarget(self, action: #selector(backToLogin), for: .touchUpInside)
    }
    
    private func setupConstraints() {
        loginLabel.snp.makeConstraints { make in
            make.top.equalTo(view).inset(224)
            make.left.equalTo(view).inset(60)
        }
        
        loginTextField.snp.makeConstraints { make in
            make.top.equalTo(loginLabel.snp.bottom).offset(12)
            make.left.equalTo(view).inset(60)
            make.right.equalTo(view).inset(60)
            make.height.equalTo(44)
        }
        
        
        passwordLabel.snp.makeConstraints { make in
            make.top.equalTo(loginTextField.snp.bottom).offset(12)
            make.left.equalTo(view).inset(60)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordLabel.snp.bottom).offset(12)
            make.left.equalTo(view).inset(60)
            make.right.equalTo(view).inset(60)
            make.height.equalTo(44)
        }
        
        registerButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(60)
            make.left.equalTo(view).inset(60)
            make.right.equalTo(view).inset(60)
            make.height.equalTo(54)
        }
        
        backButton.snp.makeConstraints { make in
            make.top.equalTo(registerButton.snp.bottom).offset(12)
            make.left.equalTo(view).inset(60)
            make.right.equalTo(view).inset(60)
            make.height.equalTo(54)
        }
        
        errorLabel.snp.makeConstraints { make in
            make.bottom.equalTo(view.snp.bottom).inset(112)
            make.centerX.equalTo(view)
        }
        
        loadingIndicator.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.centerY.equalTo(view)
        }
    }
    
    @objc
    private func backToLogin() {
        guard let navParent = self.navigationController else { return }
        router?.backToLogin(parent: navParent)
    }
}
