//
//  HomeView.swift
//  EMASeniorDesignStoryBoard
//
//  Created by Ryan Pape on 2/20/23.
//

import UIKit
var check = false
class HomeView: UIViewController {
    let noQuestion = UILabel(frame:CGRect(x: 50, y: 100, width: 300.00, height: 300.00))
    override func viewDidLoad() {
        super.viewDidLoad()
        serverCon.Recieve_Survey(completion : check_Survey)
        noQuestion.text = "No Surveys please check back later"
        noQuestion.textColor = UIColor.white
        self.view.addSubview(noQuestion)
        navigationItem.hidesBackButton = true
        setupButton()
    }
    
    @objc func check_Survey(input:Bool){
        check = input;
    }
    func setupButton() {
        view.addSubview(loginButton)
        loginButton.configuration = .filled()
        loginButton.configuration?.baseBackgroundColor = .systemBlue
        loginButton.configuration?.title = "check Survey"
        loginButton.center.x = self.view.center.x
        loginButton.center.y = self.view.center.y + 100
        loginButton.addTarget(self, action: #selector(checkSurvey), for: .touchUpInside)
        
    }
    
    
    @objc func checkSurvey() {
        
        navigationController?.pushViewController(SurveyManager.Survey.firstQuestion(), animated: true)
        
    }
}
