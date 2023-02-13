//
//  DataStructures.swift
//  EMASeniorDesignStoryBoard
//
//  Created by gwimer on 2/13/23.
//

import Foundation
struct Survery{
    static let allQuestions: [Question] = Bundle.main.decode(file: "sample.json")
    static let activeQuestion: Question = allQuestions[0]
}

protocol QuestionInterface{
    func getID() -> Int
    func getText() -> String
    func setResponse(mResponse: String)
    func getResponse() -> String
}
struct Question: Codable {
    let id: Int
    let type: String
    let text: String
    let lowerBound, upperBound: Int
    let lbDesc: String
    let ubDesc: String

    enum CodingKeys: String, CodingKey {
        case id, type, text
        case lowerBound = "lower_bound"
        case upperBound = "upper_bound"
        case lbDesc = "lb_desc"
        case ubDesc = "ub_desc"
    }
    
}
