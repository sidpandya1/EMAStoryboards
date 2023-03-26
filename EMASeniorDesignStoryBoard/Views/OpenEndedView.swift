//
//  OpenEndedView.swift
//  EMASeniorDesignStoryBoard
//
//  Created by Ryan Pape on 3/24/23.
//

import UIKit
private let answerField = UITextField(frame: CGRect(x: 0, y: 250, width: 300.00, height:100.00));
class OpenEndedView: UIViewController{
	override func viewDidLoad() {
		super.viewDidLoad()
		self.view.backgroundColor = .white
		showQuestion()
		showAnswerBox()
		previousQuestionButton()
		nextQuestionButton()
		navigationItem.hidesBackButton = true
		
	}
	
	func showAnswerBox(){
		answerField.placeholder = "Enter your response here"
		answerField.borderStyle = UITextField.BorderStyle.line
		answerField.backgroundColor = UIColor.white
		answerField.center.x = self.view.center.x
		answerField.center.y = self.view.center.y + 50
		view.addSubview(answerField)

	}
	
	func showQuestion() {
		question.text = SurveyManager.Survey.getCurrentQuestion()
		print(SurveyManager.Survey.getQuestionID())
		question.backgroundColor = .systemBlue
		question.textColor = UIColor.white
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
	@objc private func goToNextQuestion() {
        JSONEncoding.encoderJSON.addAnswerToArray(questionID: SurveyManager.Survey.getQuestionID() , response: answerField.text!)
		answerField.text?.removeAll()
		navigationController?.pushViewController(SurveyManager.Survey.nextQuestion(), animated: true)
	}
	
	@objc private func goToPreviousQuestion() {
		navigationController?.pushViewController(SurveyManager.Survey.previousQuestion(), animated: true)
	}
	
}
