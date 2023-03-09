//
//  ViewController.swift
//  EMASeniorDesignStoryBoard
//
//  Created by Siddharth on 2/12/23.
//

import UIKit

let passwordField: UITextField = UITextField(frame: CGRect(x: 50, y: 450, width: 300.00, height: 30.00));
let userIDField: UITextField = UITextField(frame: CGRect(x: 50, y: 350, width: 300.00, height: 30.00));
let loginButton = UIButton(frame:CGRect(x:125,y:600,width:150, height: 50))
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
		
        serverCon.betterrecivesurvey()
		self.view.backgroundColor = .white
			  
			  
			  emalogo.frame = CGRect(x: 80, y: 75, width: 250, height:200)
			  view.addSubview(emalogo)
		  
			  
			  psulogo.frame = CGRect(x: 80, y: 700, width: 250, height:100)
			  view.addSubview(psulogo)
			  
			  userIDField.placeholder = "User ID"
			  userIDField.borderStyle = UITextField.BorderStyle.line
			  userIDField.backgroundColor = UIColor.white
			  self.view.addSubview(userIDField)
			  
			  passwordField.placeholder = "Password"
			  passwordField.isSecureTextEntry = true
			  passwordField.borderStyle = UITextField.BorderStyle.line
			  passwordField.backgroundColor = UIColor.white
			  self.view.addSubview(passwordField)
			  
			  setupButton()
			  
		  }
		  
		  func setupButton() {
			  view.addSubview(loginButton)
			  loginButton.configuration = .filled()
			  loginButton.configuration?.baseBackgroundColor = .systemBlue
			  loginButton.configuration?.title = "Login"
			  loginButton.addTarget(self, action: #selector(loginFunction), for: .touchUpInside)
			
		  }
		  
		  @objc func loginFunction() {
			  let userID = userIDField.text!
			  let password = passwordField.text!
			  if(login.ValidateUsername(username: String(userID)) == true && login.ValidatePassword(password: password) == true){
				  let nextQuestion = SurveyManager.Survey.getCurrentQuestion()
				  //nextQuestion.type = "Scaled View"
				  navigationController?.pushViewController(SurveyManager.Survey.nextQuestion(), animated: true)
			  }
		  }

	  }
