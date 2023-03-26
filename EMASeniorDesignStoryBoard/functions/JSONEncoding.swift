//
//  JSONEncoding.swift
//  Ecological Momentary Assessment
//
//  Created by Ryan Pape on 2/14/23.
//

import Foundation

class JSONEncoding{
    
    public static let encoderJSON = JSONEncoding()
    
    
    
    private var arrayOfAnswers: [Answer] = []
    
    func addAnswerToArray(questionID: Int, response: String){
        let currentAnswer = Answer( questionID: questionID, response: response)
        arrayOfAnswers.append(currentAnswer)
        print("added answer to array")
    }
    
    func deleteLastAnswerFromArray(){
        arrayOfAnswers.removeLast()
        print("removed last answer")
    }
    
    func arraySize() -> Int{
        return arrayOfAnswers.count
    }
    
    func encodeArray() -> String{
        let encoder = JSONEncoder()
        let data = try! encoder.encode(arrayOfAnswers)
        return String(data: data, encoding: .utf8)!
    }
    func getArrayOfAnswers() -> [Answer]{
        return arrayOfAnswers
    }
}
