//
//  CreateAccountLayoutViewController.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 2/25/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import UIKit

class CreateAccountLayoutViewController: UIViewController {

    var emailTextField = UITextField(forAutoLayout: ())
    var passwordTextField = UITextField(forAutoLayout: ())
    var createAccountButton = UIButton(forAutoLayout: ())

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white

        emailTextField.placeholder = "Email"
        passwordTextField.placeholder = "Password"
        createAccountButton.setTitle("Create Account", for: .normal)
        createAccountButton.setTitleColor(UIColor.black, for: .normal)

        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(createAccountButton)

        let margins = view.layoutMarginsGuide

        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: margins.topAnchor),
            emailTextField.leadingAnchor.constraint(equalTo: margins.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: margins.trailingAnchor),
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 15),
            passwordTextField.leftAnchor.constraint(equalTo: margins.leftAnchor),
            passwordTextField.rightAnchor.constraint(equalTo: margins.rightAnchor),
            createAccountButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 15),
            createAccountButton.centerXAnchor.constraint(equalTo: margins.centerXAnchor)
            ])
    }

}