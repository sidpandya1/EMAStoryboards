//
//  SecondScreen.swift
//  EMASeniorDesignStoryBoard
//
//  Created by Siddharth on 2/20/23.
//

import UIKit

class ScaledView: UIViewController {
	let question = UILabel(frame:CGRect(x: 50, y: 100, width: 300.00, height: 300.00))
    let previousButton = UIButton(frame:CGRect(x:25,y:600,width:150, height: 50))
	let nextButton = UIButton(frame:CGRect(x:200,y:600,width:150, height: 50))
    let slider = UISlider(frame:CGRect(x:50,y:445,width:300,height:20))
	var sliderValue = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
		showQuestion()
		
		showSlider()
		
        previousQuestionButton()
        
        nextQuestionButton()
		
		navigationItem.hidesBackButton = true  
    }
 
	func showSlider(){
		self.view.addSubview(slider);
		slider.minimumValue = 0
		slider.maximumValue = 4
		slider.isContinuous = false
		slider.tintColor = .systemBlue
		slider.addTarget(self, action: #selector(self.sliderValueDidChange(_:)), for: .valueChanged)
	}
    
	
	
	
	func showQuestion() {
		question.text = SurveyManager.Survey.getCurrentQuestion()
		question.backgroundColor = .systemBlue
		question.textColor = UIColor.white
		question.textAlignment = .center
		question.numberOfLines = 0
		self.view.addSubview(question)
	}
 
    
    func nextQuestionButton() {
        view.addSubview(nextButton)
        nextButton.configuration = .filled()
        nextButton.configuration?.baseBackgroundColor = .systemBlue
        nextButton.configuration?.title = "Next"
        nextButton.addTarget(self, action: #selector(goToNextQuestion), for: .touchUpInside)
	}
    
    func previousQuestionButton() {
        view.addSubview(previousButton)
        previousButton.configuration = .filled()
        previousButton.configuration?.baseBackgroundColor = .systemBlue
        previousButton.configuration?.title = "Previous"
        previousButton.addTarget(self, action: #selector(goToPreviousQuestion), for: .touchUpInside)

    }
	
    
    @objc func goToNextQuestion() {
        let nextQuestion = SurveyManager.Survey.nextQuestion()
		JSONEncoding.encoderJSON.addAnswerToArray(id: SurveyManager.Survey.getQuestionID(), answer: String(sliderValue))
        nextQuestion.title = "Scaled View"
        navigationController?.pushViewController(nextQuestion, animated: true)
    }
    
    @objc func goToPreviousQuestion() {
        let previousQuestion = SurveyManager.Survey.previousQuestion()
        previousQuestion.title = "Scaled View"
        navigationController?.pushViewController(previousQuestion, animated: true)
    }
	
	@objc func sliderValueDidChange(_ sender:UISlider!)
	{
		print("Slider value changed")
		
		sliderValue = Double(sender.value)
	}

}
