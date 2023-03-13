//
//  SecondScreen.swift
//  EMASeniorDesignStoryBoard
//
//  Created by Siddharth & Ryan Pape on 2/20/23.
//

import UIKit

class ScaledView: UIViewController {
	let sliderLbDesc = UILabel(frame: CGRect(x: 100, y: 500, width: 20, height: 5))
	let sliderUbDesc = UILabel(frame: CGRect(x: 100, y: 500, width: 20, height: 5))
	let question = UILabel(frame:CGRect(x: 37, y: 100, width: 300.00, height: 300.00))
    let previousButton = UIButton(frame:CGRect(x:25,y:600,width:150, height: 50))
	let nextButton = UIButton(frame:CGRect(x:200,y:600,width:150, height: 50))
    let slider = UISlider(frame:CGRect(x:50,y:445,width:300,height:20))
	var sliderValue = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
		self.view.backgroundColor = .white
		showQuestion()
		
		showSlider()
		
        previousQuestionButton()
        
        nextQuestionButton()
		
		navigationItem.hidesBackButton = true  
    }
 
	func showSlider(){
		self.view.addSubview(slider);
		sliderLbDesc.text = SurveyManager.Survey.getlbDesc()
		sliderUbDesc.text = SurveyManager.Survey.getubDesc()
		sliderLbDesc.center.x = self.view.center.x - 100
		sliderUbDesc.center.x = self.view.center.x + 100
		sliderUbDesc.textColor = .systemBlue
		sliderLbDesc.textColor = .systemBlue
		slider.minimumValue = Float(SurveyManager.Survey.getQuestionLowerBound())
		slider.maximumValue = Float(SurveyManager.Survey.getQuestionUpperBound())
		slider.isContinuous = false
		slider.tintColor = .systemBlue
		slider.center.x = self.view.center.x
		slider.addTarget(self, action: #selector(self.sliderValueDidChange(_:)), for: .valueChanged)
		self.view.addSubview(sliderLbDesc)
		self.view.addSubview(sliderUbDesc)
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
	
    
    @objc func goToNextQuestion() {
		JSONEncoding.encoderJSON.addAnswerToArray(id: SurveyManager.Survey.getQuestionID(), answer: String(sliderValue))
        navigationController?.pushViewController(SurveyManager.Survey.nextQuestion(), animated: true)
    }
    
    @objc func goToPreviousQuestion() {
        navigationController?.pushViewController(SurveyManager.Survey.previousQuestion(), animated: true)
    }
	
	@objc func sliderValueDidChange(_ sender:UISlider!)
	{
		print("Slider value changed")
		
		sliderValue = Double(sender.value)
	}

}
