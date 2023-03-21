//
//  ServerConnect.swift
//  EMASeniorDesignStoryBoard
//
//  Created by gwimer on 2/13/23.
//
import Foundation
class ServerConnect{
    let Port_number = 0
    var userID = 0;
    var deviceID = 100;
    
    let Password = ""
    let Username = ""
    
    func Sign_in(password:String,username:String, completion: @escaping (Bool) -> Void) {
        userID = Int(username) ?? 0
        let url = URL(string: "https://psubehrendema.org/checkUser.php")
               guard let requestUrl = url else { fatalError() }
               var request = URLRequest(url: requestUrl)
               request.httpMethod = "POST"
               // Set HTTP Request Header
               request.setValue("application/json", forHTTPHeaderField: "Accept")
               request.setValue("application/json", forHTTPHeaderField: "Content-Type")
               let encoder = JSONEncoder()
        let mypost = http_post(userID: userID,deviceID: deviceID)
               let jsondata = try! encoder.encode(mypost)
               print(jsondata)
               request.httpBody = jsondata
        let _: Void = URLSession.shared.dataTask(with: request) { data, response, error in
                   if let data = data {
                       let output = String(decoding: data, as: UTF8.self)
                       if(output.contains("true")){
                         
                           completion(true);
                       }
                       
                   } else if let error = error {
                       print("HTTP Request Failed \(error)")
                   }
                  
               }
                   .resume()
        return
    }
    func Send_Survey( completion: @escaping (Bool) -> Void, payload : [Question]){
        // covert the Question to the type response_Survey so we can add it to the http_post
        
        
        
        let url = URL(string: "https://psubehrendema.org/setSurvey.php")
               guard let requestUrl = url else { fatalError() }
               var request = URLRequest(url: requestUrl)
               request.httpMethod = "POST"
               // Set HTTP Request Header
               request.setValue("application/json", forHTTPHeaderField: "Accept")
               request.setValue("application/json", forHTTPHeaderField: "Content-Type")
               let encoder = JSONEncoder()
        // make this part the http_post_send_survey with the coorespoidng response_Survey from above
        let mypost = http_post(userID: userID,deviceID: deviceID)
        //if this works that is the last thing

               let jsondata = try! encoder.encode(mypost)
               request.httpBody = jsondata
        let _: Void = URLSession.shared.dataTask(with: request) { data, response, error in
                   if let data = data {
                       
                       completion(true)
                   } else if let error = error {
                       print("HTTP Request Failed \(error)")
                   }
               }
                   .resume()
        
        
        
        
        
    }
    func Recieve_Survey( completion: @escaping (Bool) -> Void){
        let url = URL(string: "https://psubehrendema.org/getSurvey.php")
               guard let requestUrl = url else { fatalError() }
               var request = URLRequest(url: requestUrl)
               request.httpMethod = "POST"
               // Set HTTP Request Header
               request.setValue("application/json", forHTTPHeaderField: "Accept")
               request.setValue("application/json", forHTTPHeaderField: "Content-Type")
               let encoder = JSONEncoder()
        let mypost = http_post(userID: userID,deviceID: deviceID)
               

               let jsondata = try! encoder.encode(mypost)
               
               request.httpBody = jsondata
        let _: Void = URLSession.shared.dataTask(with: request) { data, response, error in
                   if let data = data {
                       if let Q = try? JSONDecoder().decode([Question].self, from: data) {
                           SurveyArray.allQuestions = Q
                           print(SurveyArray.allQuestions)
                           print("number of questions:", SurveyArray.allQuestions.count)
                           completion(true);
                       } else {
                           completion(false);
                           print("Error!")
                       }
                   } else if let error = error {
                       print("HTTP Request Failed \(error)")
                   }
                   
               }
                   .resume()
        
        
    }
    
}
    
    

