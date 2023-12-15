//
//  LogInViewController.swift
//  theMost
//
//  Created by Oğuzhan Abuhanoğlu on 14.12.2023.
//

import UIKit

class LogInViewController: UIViewController{
    
    struct Constants {
        static let cornerRadius : CGFloat = 8.0
    }
    
    private let headerView : UIView = {
        let header = UIView()
        header.backgroundColor = .blue
        return header
    }()
    
    
    private let usernameEmailText : UITextField = {
        let textField = UITextField()
        textField.placeholder = "Username or Email"
        textField.textAlignment = .left
        textField.returnKeyType = .next
        textField.leftViewMode = .always
        textField.autocorrectionType = .no
        textField.layer.masksToBounds = true
        textField.layer.cornerRadius = Constants.cornerRadius
        textField.backgroundColor = .secondarySystemBackground
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.secondaryLabel.cgColor
        return textField
    }()
    
    private let passwordText : UITextField = {
        let textField = UITextField()
        textField.isSecureTextEntry = true
        textField.placeholder = "Password"
        textField.textAlignment = .left
        textField.returnKeyType = .continue
        textField.leftViewMode = .always
        textField.autocorrectionType = .no
        textField.layer.masksToBounds = true
        textField.layer.cornerRadius = Constants.cornerRadius
        textField.backgroundColor = .secondarySystemBackground
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.secondaryLabel.cgColor
        return textField
    }()
    
    private let logInButton : UIButton = {
        let button = UIButton()
        button.setTitle("Log In", for: UIControl.State.normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: UIControl.State.normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = Constants.cornerRadius
        return button
    }()
    
    private let toSignUpButton : UIButton = {
        let button = UIButton()
        button.setTitle("New User? Create an account", for: UIControl.State.normal)
        button.setTitleColor(.label, for: UIControl.State.normal)
        return button
    }()
    
    private let termsButton : UIButton = {
        let button = UIButton()
        button.setTitle("Terms Of Service", for: UIControl.State.normal)
        button.setTitleColor(.secondaryLabel, for: UIControl.State.normal)
        return button
    }()
    
    private let privacyButton : UIButton = {
        let button = UIButton()
        button.setTitle("Privacy Policy", for: UIControl.State.normal)
        button.setTitleColor(.secondaryLabel, for: UIControl.State.normal)
        return button
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        usernameEmailText.delegate = self
        passwordText.delegate = self
        
        addSubviews()
        
        logInButton.addTarget(self, action: #selector(didTapLoginButton), for: UIControl.Event.touchUpInside)
        toSignUpButton.addTarget(self, action: #selector(didTaptoSignupButton), for: UIControl.Event.touchUpInside)
        termsButton.addTarget(self, action: #selector(didTapTermsButton), for: UIControl.Event.touchUpInside)
        privacyButton.addTarget(self, action: #selector(didTapPrivacyButton), for: UIControl.Event.touchUpInside)
        
    }
    
    
    private func addSubviews() {
        
        view.addSubview(headerView)
        view.addSubview(usernameEmailText)
        view.addSubview(passwordText)
        view.addSubview(logInButton)
        view.addSubview(toSignUpButton)
        view.addSubview(termsButton)
        view.addSubview(privacyButton)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let widht = view.frame.size.width
        let height = view.frame.size.height
        
        headerView.frame = CGRect(x: 0, y: view.safeAreaInsets.top , width: widht, height: height * 0.3)
        usernameEmailText.frame = CGRect(x: widht * 0.5 - (widht * 0.9) / 2 , y: height * 0.38, width: widht * 0.9, height: height * 0.055)
        passwordText.frame = CGRect(x: widht * 0.5 - (widht * 0.9) / 2, y: height * 0.45, width: widht * 0.9, height: height * 0.055)
        logInButton.frame = CGRect(x: widht * 0.5 - (widht * 0.9) / 2, y: height * 0.52, width: widht * 0.9, height: height * 0.055)
        toSignUpButton.frame = CGRect(x: widht * 0.5 - (widht * 0.9) / 2, y: height * 0.58, width: widht * 0.9, height: height * 0.055)
        termsButton.frame  = CGRect(x: widht * 0.5 - (widht * 0.9) / 2, y: height * 0.85, width: widht * 0.9, height: height * 0.05)
        privacyButton.frame  = CGRect(x: widht * 0.5 - (widht * 0.9) / 2, y: height * 0.9, width: widht * 0.9, height: height * 0.05)
        
    }
    
    @objc private func didTapLoginButton() {
        usernameEmailText.resignFirstResponder()
        passwordText.resignFirstResponder()
        
        guard let usernameEmail = usernameEmailText.text, !usernameEmail.isEmpty,
              let password = passwordText.text, !password.isEmpty else {
            return
        }
        
        //login functionality
        
        var username : String?
        var email : String?
        
        if usernameEmail.contains("@"), usernameEmail.contains("."){
            //email
            email = usernameEmail
        }else{
            //username
            username = usernameEmail
        }
        
        AuthManager.shared.loginUser(username: username, email: email, password: password) { success in
            DispatchQueue.main.async {
                if success {
                    //user logged in
                    self.dismiss(animated: true,completion: nil)
                }else {
                    //error
                    let alert = UIAlertController(title: "Log In error", message: "we were unable to log you in", preferredStyle: UIAlertController.Style.alert)
                    let dismiss = UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.default, handler: nil)
                    alert.addAction(dismiss)
                    self.present(alert, animated: true)
                }
            }
        }
        
        
    }
    
    
    
    @objc private func didTaptoSignupButton() {
        
        let signUpVC = SignUpViewController()
        signUpVC.title = "Create User"
        present(UINavigationController(rootViewController: signUpVC), animated: true)
        
    }
    
    @objc private func didTapTermsButton() {
        //en son
    }
    
    @objc private func didTapPrivacyButton() {
        //en son
    }
    

  

}

extension LogInViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameEmailText{
            passwordText.becomeFirstResponder()
        }else if textField == passwordText{
            didTapLoginButton()
        }
        return true
    }

}
