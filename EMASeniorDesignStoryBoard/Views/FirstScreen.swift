//
//  ViewController.swift
//  EMASeniorDesignStoryBoard
//
//  Created by Siddharth on 2/12/23.
//
import UIKit
let passwordField: UITextField = UITextField(frame: CGRect(x: 50, y: 325, width: 300.00, height: 30.00));
let userIDField: UITextField = UITextField(frame: CGRect(x: 50, y: 250, width: 300.00, height: 30.00));
let loginButton = UIButton(frame:CGRect(x:125,y:400,width:150, height: 50))
let login = LoginFunctions();
let EMAlogo = "EMALogo 1-2.png"
let image = UIImage(named: EMAlogo)
let emalogo = UIImageView(image: image!)
let PSUlogo = "penn_state_behrend_logo_3-4in (1)-1 1"
let image2 = UIImage(named: PSUlogo)
let psulogo = UIImageView(image: image2!)
let serverCon = ServerConnect();
class FirstScreen: UIViewController {
    var serverconnection = ServerConnect();
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        serverCon.Recieve_Survey()
        emalogo.frame = CGRect(x: 80, y: 45, width: 250, height:200)
        emalogo.center.x = self.view.center.x
		emalogo.center.y = self.view.center.y - 200
        view.addSubview(emalogo)
        psulogo.frame = CGRect(x: 80, y: 500, width: 250, height:100)
        psulogo.center.x = self.view.center.x
		psulogo.center.y = self.view.center.y + 250
        view.addSubview(psulogo)
        userIDField.placeholder = "User ID"
        userIDField.borderStyle = UITextField.BorderStyle.line
        userIDField.backgroundColor = UIColor.white
        userIDField.center.x = self.view.center.x
		userIDField.center.y = self.view.center.y - 50
        self.view.addSubview(userIDField)
        passwordField.placeholder = "Password"
        passwordField.isSecureTextEntry = true
        passwordField.borderStyle = UITextField.BorderStyle.line
        passwordField.backgroundColor = UIColor.white
        passwordField.center.x = self.view.center.x
		passwordField.center.y = self.view.center.y + 25
        self.view.addSubview(passwordField)
        setupButton()
    }
          
          func setupButton() {
              view.addSubview(loginButton)
              loginButton.configuration = .filled()
              loginButton.configuration?.baseBackgroundColor = .systemBlue
              loginButton.configuration?.title = "Login"
              loginButton.center.x = self.view.center.x
			  loginButton.center.y = self.view.center.y + 100
              loginButton.addTarget(self, action: #selector(loginFunction), for: .touchUpInside)
            
          }
          
    @objc func loginFunction() {
        let userID = userIDField.text!
        let password = passwordField.text!
        if(serverCon.Sign_in(password: password, username: userID) == true){
            
            navigationController?.pushViewController(SurveyManager.Survey.firstQuestion(), animated: true)
            
        }
    }
      }

