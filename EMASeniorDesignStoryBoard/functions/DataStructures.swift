//
//  DataStructures.swift
//  EMASeniorDesignStoryBoard
//
//  Created by gwimer on 2/13/23.
//

import Foundation
struct SurveyArray: Decodable{
	static let SC = ServerConnect()
	static var allQuestions = [Question]()
	static var login_response = [loginResponse]()
	
}
struct http_post: Codable{
    let userID: Int
    let deviceID: Int
}
struct http_post_send_survey: Codable{
    let userID: Int
    let deviceID: Int
    let survey: Question
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

struct loginResponse: Codable{
	let exists: Bool
	let deviceID: Int
}
