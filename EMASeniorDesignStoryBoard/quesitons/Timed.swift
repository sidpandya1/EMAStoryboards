//
//  Timed.swift
//  EMASeniorDesignStoryBoard
//
//  Created by  Gwimer 2/13/23.
//

import Foundation

class TimedQuestion: QuestionInterface{
    private var id: Int = 0
    private var text: String = ""
    private var response: String = ""
    
    init(id: Int, text: String, response: String) {
        self.id = id
        self.text = text
    }
    func getID() -> Int {
        return self.id
    }
    
    func getText() -> String {
        return self.text
    }
    
    func setResponse(mResponse: String) {
        self.response = mResponse
    }
    
    func getResponse() -> String {
        return self.response
    }
}
