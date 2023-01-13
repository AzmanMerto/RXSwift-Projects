//
//  LoginView.swift
//  RXSwift Project
//
//  Created by NomoteteS on 13.01.2023.
//

import Foundation
import RxSwift
import RxCocoa
import UIKit

class LoginViewController : UIViewController {
    
    // textfield
    lazy var textFieldEmail: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Email"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .emailAddress
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var textFieldPassword : UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Password"
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    // button
    
    lazy var btnLogin : UIButton = {
       let btn = UIButton()
        btn.setTitle("Login", for: .normal)
        btn.setTitleColor(UIColor.white,for: .normal)
        btn.setTitleColor(UIColor.white.withAlphaComponent(0.3), for: .highlighted)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(onTapBtnLogin), for: .touchUpInside)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        createObservables()
    }
    
    
    @objc func onTapBtnLogin() {
        
    }
    
    private func setupUI() {
        self.view.backgroundColor = .white
        self.view.addSubview(textFieldEmail)
        self.view.addSubview(textFieldPassword)
        self.view.addSubview(btnLogin)
    
        NSLayoutConstraint.activate([
            textFieldEmail.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor,constant: 20),
            textFieldEmail.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor,constant: -20),
            textFieldEmail.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20),
            textFieldPassword.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor,constant: 20),
            textFieldPassword.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor,constant: -20),
            textFieldPassword.topAnchor.constraint(equalTo: textFieldEmail.bottomAnchor,constant: 20),
            btnLogin.topAnchor.constraint(equalTo: textFieldPassword.bottomAnchor,constant: 20),
            btnLogin.widthAnchor.constraint(equalTo: textFieldEmail.widthAnchor),
            btnLogin.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])

    }
    
    private func createObservables() {
        
    }
    
}

class LoginViewModel {
    var email: BehaviorSubject<String>  = BehaviorSubject(value: "")
    var password: BehaviorSubject<String>  = BehaviorSubject(value: "")

    var isValidEmail:Observable<Bool> {
        email.map{$0.isValidEmail()}
    }
    
    var isValidPassword:Observable<Bool> {
        password.map{ $0.count < 6}
    }
    
    var isValidInput:Observable<Bool> {
        return Observable.combineLatest(isValidEmail,isValidPassword).map({ $0 && $1 })
    }
    
    
}

extension String {
    func isValidEmail() -> Bool {
        let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
        return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
    }
}
