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
    func betterrecivesurvey(){
        let url = URL(string: "https://psubehrendema.org/getSurvey.php")
               guard let requestUrl = url else { fatalError() }
               var request = URLRequest(url: requestUrl)
               request.httpMethod = "POST"
               // Set HTTP Request Header
               request.setValue("application/json", forHTTPHeaderField: "Accept")
               request.setValue("application/json", forHTTPHeaderField: "Content-Type")
               
               let encoder = JSONEncoder()
               var mypost = http_post(userID: 80061,deviceID: 100)
               
               
               let jsondata = try! encoder.encode(mypost)
               print(jsondata)
               request.httpBody = jsondata
               let task: Void = URLSession.shared.dataTask(with: request) { data, response, error in
                   if let data = data {
                       if let Q = try? JSONDecoder().decode([Question].self, from: data) {
                           SurveyArray.allQuestions = Q
						   print(SurveyArray.allQuestions)
                       } else {
                           print("Error!")
                       }
                   } else if let error = error {
                       print("HTTP Request Failed \(error)")
                   }
                   print("number of questions:", SurveyArray.allQuestions.count)
               }
                   .resume()
        
        
    }
	
}
    
    

