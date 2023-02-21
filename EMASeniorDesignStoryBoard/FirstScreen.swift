//
//  ViewController.swift
//  EMASeniorDesignStoryBoard
//
//  Created by Siddharth on 2/12/23.
//

import UIKit

let passwordField: UITextField = UITextField(frame: CGRect(x: 50, y: 280, width: 300.00, height: 30.00));
let userIDField: UITextField = UITextField(frame: CGRect(x: 50, y: 200, width: 300.00, height: 30.00));
let loginButton = UIButton()
let login = LoginFunctions();

class FirstScreen: UIViewController {
    var serverconnection = ServerConnect();

    override func viewDidLoad() {
        super.viewDidLoad()
        serverconnection.connect();
        
        userIDField.placeholder = "User ID"
        userIDField.borderStyle = UITextField.BorderStyle.line
        userIDField.backgroundColor = UIColor.white
		userIDField.textColor = .systemBlue
        self.view.addSubview(userIDField)
        
        passwordField.placeholder = "Password"
        passwordField.borderStyle = UITextField.BorderStyle.line
        passwordField.backgroundColor = UIColor.white
		passwordField.textColor = .systemBlue
		self.view.addSubview(passwordField)
        
        setupButton()
        
    }
    
    func setupButton() {
        view.addSubview(loginButton)
        loginButton.configuration = .filled()
        loginButton.configuration?.baseBackgroundColor = .systemBlue
        loginButton.configuration?.title = "Login"
        loginButton.addTarget(self, action: #selector(goToNextScreen), for: .touchUpInside)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginButton.widthAnchor.constraint(equalToConstant: 200),
            loginButton.heightAnchor.constraint(equalToConstant: 50)
        
        ])
    }
    
    @objc func goToNextScreen() {
		let userID = userIDField.text!
		let password = passwordField.text!
		if(login.ValidateUsername(username: String(userID)) == true && login.ValidatePassword(password: password) == true){
			let nextQuestion = SurveyManager.Survey.returnFirstQuestion()
			nextQuestion.title = "Scaled View"
			navigationController?.pushViewController(nextQuestion, animated: true)
		}
    }

}

