//
//  File.swift
//  Validations
//
//  Created by Sierra 2 on 14/09/17.
//  Copyright © 2017 Sierra 2. All rights reserved.
//

import Foundation

enum Alert {
    case success
    case failure
    case error
}

enum Valid {
    case success
    case failure(Alert, AlertMessages)
}

enum ValidationType {
    case email
    case stringWithFirstLetterCaps
    case phoneNo
}

enum RegEx: String {
    case email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
    case password = "^.{6,15}$"
    case alphabeticStringWithSpace = "^[a-zA-Z ]*$"
    case alphabeticString = "^[A-Z]+[a-zA-Z]*$"
    case phoneNo = "[0-9]{10,14}"
}

enum AlertMessages: String {
    case inValidEmail = "InvalidEmail"
    case emptyEmail = "Empty Email"
    case emptyName = "Empty Name"
    case invalidName = "Invalid Name"
    case emptyPhone = "Empty Phone"
    case invalidPhone = "Invalid Phone"
    func localized() -> String {
        return NSLocalizedString(self.rawValue, comment: "")
    }
}

class Validation: NSObject {
    
    public static let shared = Validation()
    
    func validate(values: (type: ValidationType, inputValue: String)...) -> Valid {
        for valueToBeChecked in values {
            switch valueToBeChecked.type {
            case .email:
                if valueToBeChecked.inputValue.isEmpty {
                    return .failure(.error, .emptyEmail)
                } else if isValidString(valueToBeChecked.inputValue, .email) != true {
                    return .failure(.error, .inValidEmail)
                }
            case .stringWithFirstLetterCaps:
                if valueToBeChecked.inputValue.isEmpty {
                    return .failure(.error, .emptyName)
                } else if isValidString(valueToBeChecked.inputValue, .alphabeticString) != true {
                    return .failure(.error, .invalidName)
                }
            case .phoneNo:
                if valueToBeChecked.inputValue.isEmpty {
                    return .failure(.error, .emptyPhone)
                } else if isValidString(valueToBeChecked.inputValue, .phoneNo) != true {
                    return .failure(.error, .invalidPhone)
                }
            }
        }
        return .success
    }
    
    func isValidString(_ testStr: String, _ regex: RegEx) -> Bool {
        let stringTest = NSPredicate(format:"SELF MATCHES %@", regex.rawValue)
        let result = stringTest.evaluate(with: testStr)
        return result
    }
}
