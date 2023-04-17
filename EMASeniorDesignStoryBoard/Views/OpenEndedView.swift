//
//  OpenEndedView.swift
//  EMASeniorDesignStoryBoard
//
//  Created by Ryan Pape on 3/24/23.
//

import UIKit

class OpenEndedView: UIViewController{
    private let answerField = UITextField(frame: CGRect(x: 0, y: 250, width: 300.00, height:100.00));
    private let previousButton = UIButton(frame:CGRect(x:25,y:600,width:150, height: 50))
    private let nextButton = UIButton(frame:CGRect(x:200,y:600,width:150, height: 50))
    private let question = UILabel(frame:CGRect(x: 37, y: 100, width: 300.00, height: 300.00))
	override func viewDidLoad() {
        updateAppearance()
		super.viewDidLoad()
		showQuestion()
		showAnswerBox()
		previousQuestionButton()
		nextQuestionButton()
		navigationItem.hidesBackButton = true
		
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
                answerField.textColor = .white
                answerField.backgroundColor = .systemGray5
                question.textColor = .white
                question.backgroundColor = .systemBlue
            case .light, .unspecified:
                answerField.textColor = .black
                answerField.backgroundColor = .white
                question.textColor = .white
                question.backgroundColor = .systemBlue
            @unknown default:
                break
            }
        }
	
	func showAnswerBox(){
		answerField.placeholder = "Enter your response here"
		answerField.borderStyle = UITextField.BorderStyle.line
		answerField.center.x = self.view.center.x
		answerField.center.y = self.view.center.y + 50
		view.addSubview(answerField)

	}
    
    
    @objc func goToNextQuestion() {
        JSONEncoding.encoderJSON.addAnswerToArray(questionID:SurveyManager.Survey.getQuestionID(), response: answerField.text!)
        answerField.text! = "";
        if(Int(SurveyManager.Survey.getCounter()) >= SurveyManager.Survey.returnMaxQuestion()-1){
            serverCon.Send_Survey(completion: send_survey, payload: JSONEncoding.encoderJSON.getArrayOfAnswers())
            SurveyManager.Survey.resetSurvey()
            SurveyManager.Survey.resetCounter()
            navigationController?.pushViewController(HomeView(), animated: true)

        }
        
        else{
            navigationController?.pushViewController(SurveyManager.Survey.nextQuestion(), animated: true)
        }
        
        
        
    }
	
    @objc func send_survey(input:Bool){
        check = input;
    }
	func showQuestion() {
		question.text = SurveyManager.Survey.getCurrentQuestion()
		print(SurveyManager.Survey.getQuestionID())
		question.backgroundColor = .systemBlue
		question.textAlignment = .center
		question.numberOfLines = 0
		question.center.x = self.view.center.x
		self.view.addSubview(question)
	}
 
	
	func nextQuestionButton() {
		view.addSubview(nextButton)
		nextButton.configuration = .filled()
		nextButton.configuration?.baseBackgroundColor = .systemBlue
		nextButton.configuration?.title = "Next"
		nextButton.center.x = self.view.center.x + 100
		nextButton.addTarget(self, action: #selector(goToNextQuestion), for: .touchUpInside)
	}
	
	func previousQuestionButton() {
		view.addSubview(previousButton)
		previousButton.configuration = .filled()
		previousButton.configuration?.baseBackgroundColor = .systemBlue
		previousButton.configuration?.title = "Previous"
		previousButton.center.x = self.view.center.x - 100
		previousButton.addTarget(self, action: #selector(goToPreviousQuestion), for: .touchUpInside)

	}
    
	@objc private func goToPreviousQuestion() {
		navigationController?.pushViewController(SurveyManager.Survey.previousQuestion(), animated: true)
	}
	
}
