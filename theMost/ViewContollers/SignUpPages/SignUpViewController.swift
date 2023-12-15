//
//  SignUpViewController.swift
//  theMost
//
//  Created by Oğuzhan Abuhanoğlu on 14.12.2023.
//

import UIKit

class SignUpViewController: UIViewController {

    struct Constants {
        static let cornerRadius : CGFloat = 8.0
    }
    
    private let usernameText : UITextField = {
        let textField = UITextField()
        textField.placeholder = "Username"
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
    
    private let emailText : UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
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
    
    private let signUpButton : UIButton = {
        let button = UIButton()
        button.setTitle("Sign Up", for: UIControl.State.normal)
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: UIControl.State.normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = Constants.cornerRadius
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        navigationItem.title = "Create New Account"
        
        addSubviews()
        
        signUpButton.addTarget(self, action: #selector(didTapSignUpButton), for: UIControl.Event.touchUpInside)
    }
    
    private func addSubviews(){
        
        view.addSubview(usernameText)
        view.addSubview(emailText)
        view.addSubview(passwordText)
        view.addSubview(signUpButton)
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let widht = view.frame.size.width
        let height = view.frame.size.height
        
        usernameText.frame = CGRect(x: widht * 0.5 - (widht * 0.9) / 2, y: height * 0.1, width: widht * 0.9 , height: height * 0.055)
        emailText.frame = CGRect(x: widht * 0.5 - (widht * 0.9) / 2, y: height * 0.17, width: widht * 0.9 , height: height * 0.055)
        passwordText.frame = CGRect(x: widht * 0.5 - (widht * 0.9) / 2, y: height * 0.24, width: widht * 0.9 , height: height * 0.055)
        signUpButton.frame = CGRect(x: widht * 0.5 - (widht * 0.9) / 2, y: height * 0.33, width: widht * 0.9 , height: height * 0.055)
        
    }
    
    @objc private func didTapSignUpButton() {
        //create new user
    }
    

 
}
