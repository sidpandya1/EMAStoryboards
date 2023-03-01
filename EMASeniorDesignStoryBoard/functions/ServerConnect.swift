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
    func connect(){
        guard let url = URL(string:"https://psubehrendema.org/getSurvey_iPhone.php") else{
            return
            
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                if let Question = try? JSONDecoder().decode([Question].self, from: data) {
                    print(Question)
                } else {
                    print("Invalid Response")
                    print(data)
                    print(response)
                    
                }
            } else if let error = error {
                print("HTTP Request Failed \(error)")
            }
        }
            .resume()
        
        
        //           let decoder = JSONDecoder()
        //        let questions = try! decoder.decode([Question].self, from: data)
        //
        //
        //            for question in questions{
        //                print(question.text)
        //
        //
        //            }
        
        
        
        
    }
    
    
}
    
    

