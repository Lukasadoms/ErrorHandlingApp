//
//  AccountSaveError.swift
//  ErrorHandlingApp
//
//  Created by Lukas Adomavicius on 12/21/20.
//

import Foundation

enum ErrorHandling: Error {
    case invalidUsername
    case invalidPassword
    case invalidEmail


    var errorDescription: String{
        switch self {
        case .invalidEmail:
            return "You`ve entered an invalid email (must contain @ and . )"
        case .invalidPassword:
            return "You`ve entered an invalid Password (not enough characters, uppercase/lowerCase or digits)"
        case .invalidUsername:
            return "You`ve entered an invalid Username (must only be lowercase letters)"
        }
    }
}
