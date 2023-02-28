//
//  ServerConnect.swift
//  EMASeniorDesignStoryBoard
//
//  Created by gwimer on 2/13/23.
//

import Foundation

class ServerConnect{
    let Port_number = 0
    
    let Password = ""
    let Username = ""
    
    func Sign_in(password:String,username:String) ->Bool {
        if(username == Username &&  password == Password){
            return true
        }
        else{
            return false
        }
        
        
        
    }
    func receiveSurvey(){
	
        guard let url = URL(string:"https://psubehrendema.org/getSurvey_iPhone.php") else{
            return
        }
		let task: Void = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
				if let Question = try? JSONDecoder().decode(Survery.self, from: data) {
                    print(Question)
                } else {
                    print("Error!")
                }
            } else if let error = error {
                print("HTTP Request Failed \(error)")
            }
        }
            .resume()
    }
    
    
}
    
    

