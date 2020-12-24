//
//  ViewController.swift
//  ErrorHandlingApp
//
//  Created by Arnas Sleivys on 2020-12-19.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    

    @IBAction func saveButtonPressed(_ sender: Any) {
        validateFields()
    }

    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let alertAction = UIAlertAction(
            title: "OK",
            style: .default
        )
        alertController.addAction(alertAction)
        present(alertController, animated: true)
    }
}

    //MARK: - Validation logic
private extension ViewController {
    
    func validateFields() -> Bool {
        do{
            try checkEmailValidity()
            try checkUsernameValidity()
            try checkPasswordValidity()
            showAlert(title: "success", message: "Successfully logged in")
            return true
            
        } catch{
            if let error = error as? ErrorHandling {
                showAlert(title: "Uh-oh", message: error.errorDescription)
            }else{
                showAlert(title: "Uh-oh", message: "Unknow Error!")
            }
        return false
        }
 
    }
    func checkEmailValidity () throws -> Bool{
  
        guard let email = emailTextField.text else {
            throw ErrorHandling.invalidEmail
        }
        
        guard email.contains("@"),
              email.contains(".")
        else{
            throw ErrorHandling.invalidEmail
        }
        return true
    }
    
    func checkUsernameValidity() throws -> Bool{
       
        
        guard let username = usernameTextField.text else{
            throw ErrorHandling.invalidUsername
        }

        guard username.rangeOfCharacter(from: CharacterSet.letters) != nil else{
            throw ErrorHandling.invalidUsername
        }
        
        guard username == username.lowercased() else{
            throw ErrorHandling.invalidUsername
        }
        return true
    }
    
    func checkPasswordValidity() throws -> Bool{
        
        guard let password = passwordTextField.text else {
            throw ErrorHandling.invalidPassword
        }
        guard password.count >= 8 else {
            throw ErrorHandling.invalidPassword
            
        }

        var containsLowercase = false
        var containsUppercase = false
        var containsNumbers = false

        password.forEach { character in
            if character.isLowercase { containsLowercase = true }
            if character.isUppercase { containsUppercase = true }
            if character.isNumber { containsNumbers = true }
        }
        guard containsLowercase && containsUppercase && containsNumbers else{
            throw ErrorHandling.invalidPassword
        }
        return true
    }
}
