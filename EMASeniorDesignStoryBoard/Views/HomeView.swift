//
//  HomeView.swift
//  EMASeniorDesignStoryBoard
//
//  Created by Ryan Pape on 2/20/23.
//

import UIKit
var check = false
let checkButton = UIButton(frame:CGRect(x:125,y:400,width:150, height: 50))
let logoutButton = UIButton(frame:CGRect(x:125,y:400,width:150, height: 50))
//let serverCon = ServerConnect();
class HomeView: UIViewController {
    let noQuestion = UILabel(frame:CGRect(x: 50, y: 100, width: 300.00, height: 300.00))
    override func viewDidLoad() {
        updateAppearance()
        super.viewDidLoad()
        noQuestion.text = "No Surveys please check back later"
        noQuestion.textColor = UIColor.systemBlue
		noQuestion.center.x = self.view.center.x
		noQuestion.center.y = self.view.center.y - 150
		noQuestion.textAlignment = .center
        self.view.addSubview(noQuestion)
        navigationItem.hidesBackButton = true
        setupButton()
		setupLogoutButton()
		
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        if traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) {
            updateAppearance()
        }
    }
    
    func updateAppearance() {
            updateBackgroundColor()
            updateTextFieldAppearance()
        }

    func updateBackgroundColor() {
        switch traitCollection.userInterfaceStyle {
        case .dark:
            view.backgroundColor = .systemBackground // Use a dark background color for dark mode
        case .light, .unspecified:
            view.backgroundColor = .systemBackground // Use a light background color for light mode or when the mode is unspecified
        @unknown default:
            break
        }
    }
    
    func updateTextFieldAppearance() {
            switch traitCollection.userInterfaceStyle {
            case .dark:
                userIDField.textColor = .white
                userIDField.backgroundColor = .systemGray5
                passwordField.textColor = .white
                passwordField.backgroundColor = .systemGray5
            case .light, .unspecified:
                userIDField.textColor = .black
                userIDField.backgroundColor = .white
                passwordField.textColor = .black
                passwordField.backgroundColor = .white
            @unknown default:
                break
            }
        }
	func setupLogoutButton(){
		view.addSubview(logoutButton)
		logoutButton.configuration = .filled()
		logoutButton.configuration?.baseBackgroundColor = .systemBlue
		logoutButton.configuration?.title = "Logout"
		logoutButton.center.x = self.view.center.x
		logoutButton.center.y = self.view.center.y + 200
		logoutButton.addTarget(self, action: #selector(logout), for: .touchUpInside)
	}
    
    @objc func check_Survey(input:Bool){
        check = input;
    }
    func setupButton() {
        view.addSubview(checkButton)
        checkButton.configuration = .filled()
        checkButton.configuration?.baseBackgroundColor = .systemBlue
        checkButton.configuration?.title = "Load Survey"
        checkButton.center.x = self.view.center.x
        checkButton.center.y = self.view.center.y + 100
        checkButton.addTarget(self, action: #selector(checkSurvey), for: .touchUpInside)
        
    }
    
    
    @objc func checkSurvey() {
        serverCon.Recieve_Survey(completion : check_Survey)
        Thread.sleep(forTimeInterval: 1)
		if (check == true){
			navigationController?.pushViewController(SurveyManager.Survey.firstQuestion(), animated: true)
		}
    }
    @objc func send_survey(input:Bool){
        check = input;
    }
	
	@objc func logout() {
		//Thread.sleep(forTimeInterval: 1)
		SurveyManager.Survey.resetCounter()
		SurveyManager.Survey.resetSurvey()
		exit(0)
		
	}
}
