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
        userID = Int(username) ?? 0 // sets it to the vaule of the username defalts to zero if there is not a convertable int from username
        let url = URL(string: "https://psubehrendema.org/checkUser.php") //give the url of the check user
               guard let requestUrl = url else { fatalError() }
               var request = URLRequest(url: requestUrl) // where the rquest is happening
               request.httpMethod = "POST" // Set HTTP Request Header
               request.setValue("application/json", forHTTPHeaderField: "Accept")
               request.setValue("application/json", forHTTPHeaderField: "Content-Type") // set expected response type
               let encoder = JSONEncoder() // encoder for json
               let mypost = http_post(userID: userID,deviceID: deviceID) // create the http post
        
               let jsondata = try! encoder.encode(mypost)
               print(jsondata)
               request.httpBody = jsondata // set the body to the json data that was crated earlier
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
    func Send_Survey( completion: @escaping (Bool) -> Void, payload : [Answer]){
        let url = URL(string: "https://psubehrendema.org/setSurvey.php")
               guard let requestUrl = url else { fatalError() }
               var request = URLRequest(url: requestUrl)
               request.httpMethod = "POST"
               // Set HTTP Request Header
               request.setValue("application/json", forHTTPHeaderField: "Accept")
               request.setValue("application/json", forHTTPHeaderField: "Content-Type")
               let encoder = JSONEncoder()
        // make this part the http_post_send_survey with the coorespoidng response_Survey from above
        let mypost = http_post_send_survey(userID: userID,deviceID: deviceID,survey: payload)
        //if this works that is the last thing

               let jsondata = try! encoder.encode(mypost)
               request.httpBody = jsondata
        let _: Void = URLSession.shared.dataTask(with: request) { data, response, error in
                   if let data = data {
                       
                       completion(true)
                   } else if let error = error {
                       print("HTTP Request Failed \(error)")
                       completion(false)
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
    
    

