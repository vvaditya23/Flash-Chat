//
//  ValidationsCheck.swift
//  Flash-Chat
//
//  Created by ヴィヤヴャハレ・アディティア on 19/03/23.
//

import Foundation

class ValidationsCheck {
    
    func isValidEmailAddress(emailAddressString: String) -> Bool {
        
        var returnValue = true
        let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        
        do {
            let regex = try NSRegularExpression(pattern: emailRegEx)
            let nsString = emailAddressString as NSString
            let results = regex.matches(in: emailAddressString, range: NSRange(location: 0, length: nsString.length))
            
            if results.count == 0
            {
                returnValue = false
            }
            
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            returnValue = false
        }
        
        return  returnValue
    }
    
    //
    func isValidPassword(passwordAddressString: String) -> Bool {
        
        var returnValue = true
        let passwordRegEx = "^(?=.*[A-Z])(?=.*[!@#$&*])(?=.*[0-9])(?=.*[a-z]).{8}$"
                        //*[A-Z] -> should contain at least 1 capital alphabet
                        //.*[!@#$&*] -> should contain at least 1 special character
                        //.*[0-9] -> should contain at lease 1 digit
                        //.*[a-z] -> should ocntain at lease one smallcase character
                        //.{8} -> length should be 8
                    ///flexibility is req in password, it doesn't accept passwords longer than 8
        
        do {
            let regex = try NSRegularExpression(pattern: passwordRegEx)
            let nsString = passwordAddressString as NSString
            let results = regex.matches(in: passwordAddressString, range: NSRange(location: 0, length: nsString.length))
            
            if results.count == 0
            {
                returnValue = false
            }
            
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            returnValue = false
        }
        
        return  returnValue
    }
}
