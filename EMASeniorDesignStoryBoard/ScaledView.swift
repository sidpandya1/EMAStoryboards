//
//  SecondScreen.swift
//  EMASeniorDesignStoryBoard
//
//  Created by Siddharth on 2/20/23.
//

import UIKit

class ScaledView: UIViewController {
    
    let nextButton = UIButton()
    
    let previousButton = UIButton()
    let slider = UISlider(frame:CGRect(x:50,y:500,width:300,height:20))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let question = UILabel(frame:CGRect(x: 50, y: 200, width: 300.00, height: 300.00))
        question.text = SurveyManager.Survey.getCurrentQuestion()
        // Set UITextField background colour
        question.backgroundColor = UIColor.blue
        // Set UITextField text color
        question.textColor = UIColor.white
        question.textAlignment = .center
        question.numberOfLines = 0
        self.view.addSubview(question)
        
        self.view.addSubview(slider);
        
        
        previousQuestionButton()
        
        nextQuestionButton()
    }
     func viewWillappear(){
        
        // Do any additional setup after loading the view.
        let question = UILabel(frame:CGRect(x: 50, y: 200, width: 300.00, height: 300.00))
        question.text = SurveyManager.Survey.getCurrentQuestion()
        // Set UITextField background colour
        question.backgroundColor = UIColor.blue
        // Set UITextField text color
        question.textColor = UIColor.white
        question.textAlignment = .center
        self.view.addSubview(question)
        
        
        
        previousQuestionButton()
        
        nextQuestionButton()
    }
    
 
    
    func nextQuestionButton() {
        view.addSubview(nextButton)
        
        nextButton.configuration = .filled()
        nextButton.configuration?.baseBackgroundColor = .systemBlue
        nextButton.configuration?.title = "Next"
        
        
        
        nextButton.addTarget(self, action: #selector(goToNextQuestion), for: .touchUpInside)
        
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.frame = CGRect(x:50,y:500,width:300, height: 300)
        NSLayoutConstraint.activate([
         
            nextButton.centerXAnchor.constraint(equalTo: view.leftAnchor),
            nextButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            nextButton.widthAnchor.constraint(equalToConstant: 200),
            nextButton.heightAnchor.constraint(equalToConstant: 50)
        
        ])
    }
    
    func previousQuestionButton() {
        view.addSubview(previousButton)
        
        previousButton.configuration = .filled()
        previousButton.configuration?.baseBackgroundColor = .systemBlue
        previousButton.configuration?.title = "Previous"
        
        
        
        previousButton.addTarget(self, action: #selector(goToPreviousQuestion), for: .touchUpInside)
        
        previousButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.frame = CGRect(x:50,y:700,width:300, height: 300)
        NSLayoutConstraint.activate([
            
            previousButton.centerXAnchor.constraint(equalTo: view.rightAnchor),
            previousButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            previousButton.widthAnchor.constraint(equalToConstant: 200),
            previousButton.heightAnchor.constraint(equalToConstant: 50)
        
        ])
    }
    
    
    @objc func goToNextQuestion() {
    
        let nextQuestion = SurveyManager.Survey.nextQuestion()
        nextQuestion.title = "Scaled View"
        navigationController?.pushViewController(nextQuestion, animated: true)
    }
    
    @objc func goToPreviousQuestion() {
        let previousQuestion = SurveyManager.Survey.previousQuestion()
        previousQuestion.title = "Scaled View"
        navigationController?.pushViewController(previousQuestion, animated: true)
    }


}
