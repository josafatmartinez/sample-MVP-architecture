//
//  ViewController.swift
//  sampleMVParchitecture
//
//  Created by Josafat Martínez  on 27/05/20.
//  Copyright © 2020 Josafat Martínez . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - IBOutlets

    @IBOutlet var usernameTextFild: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var signinButton: UIButton!
    
    // MARK: - Properties

    var userPresenter: UserPresenter!

    // MARK: - viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.userPresenter = UserPresenter(delegate: self)
        guard let spinner = self.spinner else { return }
        spinner.hidesWhenStopped = true
    }

    // MARK: - IBActions
    @IBAction func buttonSignInDidTap() {
        guard let presenter = userPresenter else { return }
        guard let username = usernameTextFild.text else { return }
        guard let password = passwordTextField.text else { return }
        presenter.register(username: username, password: password)
    }
}
extension ViewController: UserDelegate {
    func signinDidSucceed() {
        signinButton.setTitle("Success", for: .normal)
        signinButton.setTitleColor(.green, for: .normal)
        usernameTextFild.text = ""
        passwordTextField.text = ""
    }
    
    func signinDidFailed(message: String) {
        usernameTextFild.placeholder = message
    }
    
    func showProgress() {
        guard let spinner = self.spinner else { return }
        spinner.startAnimating()
    }
    
    func hideProgress() {
        guard let spinner = self.spinner else { return }
        spinner.stopAnimating()
    }
    
}
