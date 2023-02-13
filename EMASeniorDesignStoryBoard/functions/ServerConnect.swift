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
        let url = URL(string:"https://psubehrendema.org/")
        URLSession.shared.dataTask(with: url!, completionHandler: {(data ,respones ,error) in guard let data = data, error == nil else{print(error!);return}
        //preform extratction
           
            
            
            
        }).resume()
                                   
    }
    
    
    
    
    
}
