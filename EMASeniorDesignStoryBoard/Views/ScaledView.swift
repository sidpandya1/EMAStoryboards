//
//  SecondScreen.swift
//  EMASeniorDesignStoryBoard
//
//  Created by Siddharth & Ryan Pape on 2/20/23.
//

import UIKit

class ScaledView: UIViewController {
	private let sliderLbDesc = UILabel(frame: CGRect(x: 100, y: 465, width: 100, height: 30))
	private let sliderUbDesc = UILabel(frame: CGRect(x: 100, y: 465, width: 100, height: 30))
	private let question = UILabel(frame:CGRect(x: 37, y: 100, width: 300.00, height: 300.00))
	private let previousButton = UIButton(frame:CGRect(x:25,y:600,width:150, height: 50))
	private let nextButton = UIButton(frame:CGRect(x:200,y:600,width:150, height: 50))
	private let slider = UISlider(frame:CGRect(x:50,y:445,width:300,height:20))
	private var sliderValue: Double = 0.0
	private let step: Float = 1
    
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
        sliderLbDesc.center.x = self.view.center.x - 125
        sliderUbDesc.center.x = self.view.center.x + 125
        sliderLbDesc.textAlignment = .center
        sliderUbDesc.textAlignment = .center
		sliderLbDesc.lineBreakMode = .byWordWrapping
		sliderLbDesc.numberOfLines = 0
		sliderLbDesc.sizeToFit()
		sliderUbDesc.lineBreakMode = .byWordWrapping
		sliderUbDesc.numberOfLines = 0
		sliderUbDesc.sizeToFit()
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
        JSONEncoding.encoderJSON.addAnswerToArray(questionID:SurveyManager.Survey.getQuestionID(), response: String(Int(sliderValue)))
        
        if(Int(SurveyManager.Survey.getCounter()) == SurveyManager.Survey.returnMaxQuestion()-1){
            serverCon.Send_Survey(completion: send_survey, payload: JSONEncoding.encoderJSON.getArrayOfAnswers())
            SurveyManager.Survey.resetSurvey()
            SurveyManager.Survey.resetCounter()
            navigationController?.pushViewController(HomeView(), animated: true)

        }
        
        else{
            navigationController?.pushViewController(SurveyManager.Survey.nextQuestion(), animated: true)
        }
        
        
        
    }
    
    @objc func goToPreviousQuestion() {
        navigationController?.pushViewController(SurveyManager.Survey.previousQuestion(), animated: true)
    }
    
    @objc func sliderValueDidChange(_ sender:UISlider!){
		print("Slider value changed")
		let roundedStepValue = round(sender.value / step) * step
		sender.value = roundedStepValue
		sliderValue = Double(sender.value)
		print(sliderValue)
    }
    
    @objc func send_survey(input:Bool){
        check = input;
    }

}
