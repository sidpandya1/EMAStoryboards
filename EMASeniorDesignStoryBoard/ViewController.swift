//
//  ViewController.swift
//  EMASeniorDesignStoryBoard
//
//  Created by Siddharth on 2/12/23.
//

import UIKit

class ViewController: UIViewController {
    var serverconnection = ServerConnect();
    override func viewDidLoad() {
        super.viewDidLoad()
        serverconnection.connect();
        
        // Do any additional setup after loading the view.
    }
   

}

