//
//  loginFunctions.swift
//  EMASeniorDesignStoryBoard
//
//  Created by gwimer on 2/13/23.
//

import Foundation
class LoginFunctions{
    private var passwordBool = true
    private var usernameBool = true
    func ValidateUsername(username: String) -> Bool{
        var usernameBool = false
        if(username.count == 5){
            usernameBool = true
        }
        return usernameBool
    }
    func ValidatePassword(password: String) -> Bool{
        var passwordBool = true
        if(password.count >= 8){
            passwordBool = false
        }
        if (password.count < 20){
            passwordBool = true
        }
        return passwordBool
    }
}
