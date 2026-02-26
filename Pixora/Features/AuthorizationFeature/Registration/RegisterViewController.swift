//
//  snpViewController.swift
//  Pixora
//
//  Created by Artem Khakimullin on 17.02.2026.
//

import Swinject
import UIKit

class RegisterViewController: NavigationChildController {
    
    // MARK: - UIComponents
    
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
    
    var interactor: RegisterInteractorProtocol?
    
    var router: AuthRouterProtocol?

    // MARK: - Override
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupViews()
        setupConstraints()
    }
    
    // MARK: - Public Methods
    
    func setRegisterEnabled(isEnabled: Bool) {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            
            registerButton.isEnabled = isEnabled

        }
    }
    
    func setIsLoading(isLoading: Bool) {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            
            self.registerButton.isEnabled = !isLoading
            self.backButton.isEnabled = !isLoading
            self.loginTextField.isEnabled = !isLoading
            self.passwordTextField.isEnabled = !isLoading
            
            if isLoading {
                loadingIndicator.startAnimating()
            } else {
                loadingIndicator.stopAnimating()
            }
        }
    }
    
    func showErrorText(errorText: String) {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            
            self.errorLabel.text = errorText
            self.errorLabel.isHidden = false
        }
    }
    
    func hideErrorText() {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            
            self.errorLabel.isHidden = true
        }
    }
    
    func successRegister() {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            guard let navParent = self.navigationController else { return }
            
            do {
                try router?.goToAuthorizedScreen(parent: navParent)
            } catch _ as DIErrors {
                showDIError()
            } catch {
                showErrorAlert(title: "Unknown error")
            }
        }
    }
    
    // MARK: - Private Methods
    
    private func setupViews() {
        let subviews = [loginLabel, loginTextField, passwordLabel, passwordTextField,
                        registerButton, backButton, errorLabel, loadingIndicator]
        subviews.forEach { view.addSubview($0) }
        
        passwordTextField.isSecureTextEntry = true
        
        errorLabel.isHidden = true
        
        registerButton.isEnabled = false
        
        loadingIndicator.color = .trueBlack
        loadingIndicator.style = .large
                
        backButton.addTarget(self, action: #selector(backToLogin), for: .touchUpInside)
        
        registerButton.addTarget(self, action: #selector(registerUser), for: .touchUpInside)
        
        loginTextField.addTarget(self, action: #selector(loginDidChange), for: .editingChanged)
        
        passwordTextField.addTarget(self, action: #selector(passwordDidChange), for: .editingChanged)

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
    
    @objc
    func registerUser() {
        interactor?.registerUser()
    }
    
    @objc
    func loginDidChange(_ textField: UITextField) {
        interactor?.updateLogin(textField.text ?? "")
    }
    
    @objc
    func passwordDidChange(_ textField: UITextField) {
        interactor?.updatePassword(textField.text ?? "")
    }
}
