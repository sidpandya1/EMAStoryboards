//
//  JSONManager.swift
//  EMASeniorDesignStoryBoard
//
//  Created by gwimer on 2/13/23.
//

import Foundation

extension Bundle{ //decodes file to question
    func decode<T: Decodable>(file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else{
            fatalError("Could not find \(file) in your project")
        }
        guard let data = try? Data(contentsOf: url) else{
            fatalError("Could not load \(file) in your project")
        }
        let decoder = JSONDecoder()
        guard let loadedData = try? decoder.decode(T.self, from: data) else {
            fatalError("Could not decode \(file) in your project")
        }
        return loadedData
    }
    
}


// big plays ryan


var Question_text = "Question will go here"
var buttonOne = "Previous"
var buttonTwo = "Next"
