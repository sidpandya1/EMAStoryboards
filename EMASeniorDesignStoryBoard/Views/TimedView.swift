//
//  TimedView.swift
//  EMASeniorDesignStoryBoard
//
//  Created by Ryan Pape on 3/20/23.
//

import UIKit

class TimedView: UIViewController{
    private let question = UILabel(frame:CGRect(x: 37, y: 100, width: 300.00, height: 300.00))
    private let timePicker = UIDatePicker()

    private let previousButton = UIButton(frame:CGRect(x:25,y:600,width:150, height: 50))
    private let nextButton = UIButton(frame:CGRect(x:200,y:600,width:150, height: 50))
	override func viewDidLoad() {
        updateAppearance()
		super.viewDidLoad()
		self.view.backgroundColor = .white
		showQuestion()
		
		showTimePicker()
		
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
                question.textColor = .white
                question.backgroundColor = .systemBlue
            case .light, .unspecified:
                question.textColor = .white
                question.backgroundColor = .systemBlue
            @unknown default:
                break
            }
        }
	
	func showTimePicker(){
		timePicker.datePickerMode = .time
		timePicker.addTarget(self, action:#selector(timeChange(timePicker:)), for: UIControl.Event.valueChanged)
		timePicker.frame.size = CGSize(width: 100, height: 200)
		timePicker.center.y = self.view.center.y + 100
		timePicker.center.x = self.view.center.x
		timePicker.preferredDatePickerStyle = .compact
		self.view.addSubview(timePicker)
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
    
    @objc func goToNextQuestion() {
        
        
        
        let dateFormatter = DateFormatter()
        let selectedDate = timePicker.date

        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: selectedDate)
        let minute = calendar.component(.minute, from: selectedDate)
       
        let output = "\(hour):\(minute)"
        print(output)
        JSONEncoding.encoderJSON.addAnswerToArray(questionID:SurveyManager.Survey.getQuestionID(), response: String(output))
        
        
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
	
	func previousQuestionButton() {
		view.addSubview(previousButton)
		previousButton.configuration = .filled()
		previousButton.configuration?.baseBackgroundColor = .systemBlue
		previousButton.configuration?.title = "Previous"
		previousButton.center.x = self.view.center.x - 100
		previousButton.addTarget(self, action: #selector(goToPreviousQuestion), for: .touchUpInside)

	}
	
	
	@objc func goToPreviousQuestion() {
		navigationController?.pushViewController(SurveyManager.Survey.previousQuestion(), animated: true)
	}
	
	@objc func timeChange(timePicker: UIDatePicker){
		
	}
}
