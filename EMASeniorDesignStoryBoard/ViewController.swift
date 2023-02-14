//
//  ViewController.swift
//  EMASeniorDesignStoryBoard
//
//  Created by Siddharth on 2/12/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func loginButton() {
        let vc = storyboard?.instantiateViewController(identifier: "QuestionView") as! QuestionControllerViewController
        present(vc, animated: true)
    }
    

}

