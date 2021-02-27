//
//  LoginViewController.swift
//  Chaty
//
//  Created by Ezana Tesfaye on 2/26/21.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let label: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.font = .systemFont(ofSize: 20,weight: .bold)
        label.text = "Login"
        return label
        
    }()
    
    private let imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "full logo")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.clipsToBounds = true
        return scrollView
    }()
    
    private let emailField : UITextField = {
        let field = UITextField()
        field.autocorrectionType = .no
        field.autocapitalizationType = .none
        field.returnKeyType = .continue
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.placeholder = "Email Address..."
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .white
        return field
    }()
    
    private let passwordField : UITextField = {
        let field = UITextField()
        field.autocorrectionType = .no
        field.autocapitalizationType = .none
        field.returnKeyType = .done
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.placeholder = "Password..."
        field.isSecureTextEntry = true
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = .white
        return field
    }()
    
    private let loginButton : UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.backgroundColor = UIColor(named: "brightOrange")
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        button.titleLabel?.font = .systemFont(ofSize: 20,weight: .bold)
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login"
        view.backgroundColor = UIColor(named: "darkblue")
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Register", style: .done, target: self, action: #selector(didTapRegister))
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        emailField.delegate = self
        passwordField.delegate = self
        
        //add subviews
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
        scrollView.addSubview(emailField)
        scrollView.addSubview(passwordField)
        scrollView.addSubview(loginButton)

        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.frame = view.bounds
        
        let size = view.width / 3
        imageView.frame = CGRect(x: (scrollView.width - size)/2, y: 50, width: size, height: size * 1.2)
//        label.frame = CGRect(x: 30, y: imageView.bottom+15, width: scrollView.width-60, height: 52)
        emailField.frame = CGRect(x: 30, y: imageView.bottom+15, width: scrollView.width-60, height: 52)
        passwordField.frame = CGRect(x: 30, y: emailField.bottom+15, width: scrollView.width-60, height: 52)
        loginButton.frame = CGRect(x: 30, y: passwordField.bottom+15, width: scrollView.width-60, height: 52)
    }
    @objc func didTapRegister(){
        let vc = RegisterViewController()
        vc.title = "Create Account"
        navigationController?.pushViewController(vc, animated: false)
    }
    
    @objc private func loginButtonTapped(){
        emailField.resignFirstResponder()
        passwordField.resignFirstResponder()
        guard let email = emailField.text,let password = passwordField.text,!email.isEmpty, !password.isEmpty,password.count >= 6 else {
            alertUserLoginError()
            return
        }
        
        //firebase login
        
    }
    func alertUserLoginError(){
        let alert = UIAlertController(title: "Woops", message: "Please enter all the information required", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        present(alert, animated: true)
        
    }


}
extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailField {
            passwordField.becomeFirstResponder()
        }else if textField == passwordField {
            loginButtonTapped()
        }
        return true
    }
    
}
