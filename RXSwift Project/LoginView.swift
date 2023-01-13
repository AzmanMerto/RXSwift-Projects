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
    lazy var textFiledEmail: UITextField = {
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
    
    @objc func onTapBtnLogin() {
        
    }
    
    private func setupUI() {
        self.view.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    
    
    
}
