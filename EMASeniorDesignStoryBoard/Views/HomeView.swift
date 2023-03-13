//
//  HomeView.swift
//  EMASeniorDesignStoryBoard
//
//  Created by Ryan Pape on 2/20/23.
//

import UIKit

class HomeView: UIViewController {
	let noQuestion = UILabel(frame:CGRect(x: 50, y: 100, width: 300.00, height: 300.00))
    override func viewDidLoad() {
        super.viewDidLoad()
		noQuestion.text = "No Surverys please check back later"
		noQuestion.textColor = UIColor.white
		self.view.addSubview(noQuestion)
		navigationItem.hidesBackButton = true  
    }

}
