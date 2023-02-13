//
//  Scaled.swift
//  EMASeniorDesignStoryBoard
//
//  Created by Gwimer on 2/13/23.
//

import Foundation
class ScaledQuestion: QuestionInterface{
    private var id: Int = 0
    private var lowerBound: Int = 0
    private var upperBound: Int = 0
    private var text: String = ""
    private var response: String = ""
    private var lowerDesc: String = ""
    private var uppperDesc: String = ""
    
    init(mID: Int, mText: String){
        self.id = mID
        self.text = mText
    }

    func setLowerBound(mLowerBound: Int) {
        self.lowerBound = mLowerBound
    }
    
    func setUpperBound(mUpperBound: Int) {
        self.upperBound = mUpperBound
    }
    
    func getLowerBound() -> Int {
        return self.lowerBound
    }
    
    func getUpperBound() -> Int {
        return self.upperBound
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
