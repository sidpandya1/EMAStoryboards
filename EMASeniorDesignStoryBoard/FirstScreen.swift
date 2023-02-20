//
//  ViewController.swift
//  EMASeniorDesignStoryBoard
//
//  Created by Siddharth on 2/12/23.
//

import UIKit

class FirstScreen: UIViewController {
    var serverconnection = ServerConnect();
    
    let loginButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        serverconnection.connect();
        
        
        
        let QuestionField: UITextField = UITextField(frame: CGRect(x: 50, y: 200, width: 300.00, height: 30.00));
        // Or you can position UITextField in the center of the view
        //QuestionField.center = self.view.center
        // Set UITextField placeholder text
        QuestionField.placeholder = "username"
        // Set text to UItextField
        QuestionField.text = "username"
        // Set UITextField border style
        QuestionField.borderStyle = UITextField.BorderStyle.line
        // Set UITextField background colour
        QuestionField.backgroundColor = UIColor.white
        // Set UITextField text color
        QuestionField.textColor = UIColor.blue
        // Add UITextField as a subview
        self.view.addSubview(QuestionField)
        
        let QuestionField2: UITextField = UITextField(frame: CGRect(x: 50, y: 280, width: 300.00, height: 30.00));
        // Or you can position UITextField in the center of the view
        //QuestionField.center = self.view.center
        // Set UITextField placeholder text
        QuestionField2.placeholder = "password"
        // Set text to UItextField
        QuestionField2.text = "password"
        // Set UIText2Field border style
        QuestionField2.borderStyle = UITextField.BorderStyle.line
        // Set UITextField background colour
        QuestionField2.backgroundColor = UIColor.white
        // Set UITextField text color
        QuestionField2.textColor = UIColor.blue
        // Add UITextField as a subview
        self.view.addSubview(QuestionField2)
        
        setupButton()
        
        
        // Do any additional setup after loading the view.
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
        let nextScreen = ScaledView()
        nextScreen.title = "Scaled View"
        navigationController?.pushViewController(nextScreen, animated: true)
    }

}

