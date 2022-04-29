//
//  RegisterVC.swift
//  EventApp
//
//  Created by Nitin Sakhare on 24/04/22.
//

import UIKit

class RegisterVC: UIViewController {
    
    @IBOutlet weak var firstNameTF: UITextField!
    @IBOutlet weak var lastNameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var confirPasswordTF: UITextField!
    @IBOutlet weak var btnSubmit: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        firstNameTF.layer.borderWidth = 1
        firstNameTF.layer.borderColor = UIColor.white.cgColor
        lastNameTF.layer.borderWidth = 1
        lastNameTF.layer.borderColor = UIColor.white.cgColor
        emailTF.layer.borderWidth = 1
        emailTF.layer.borderColor = UIColor.white.cgColor
        passwordTF.layer.borderWidth = 1
        passwordTF.layer.borderColor = UIColor.white.cgColor
        confirPasswordTF.layer.borderWidth = 1
        confirPasswordTF.layer.borderColor = UIColor.white.cgColor
        
        firstNameTF.setLeftPaddingPoints(10)
        firstNameTF.setRightPaddingPoints(10)
        lastNameTF.setLeftPaddingPoints(10)
        lastNameTF.setRightPaddingPoints(10)
        emailTF.setLeftPaddingPoints(10)
        emailTF.setRightPaddingPoints(10)
        passwordTF.setLeftPaddingPoints(10)
        passwordTF.setRightPaddingPoints(10)
        confirPasswordTF.setLeftPaddingPoints(10)
        confirPasswordTF.setRightPaddingPoints(10)
        
        firstNameTF.attributedPlaceholder =
        NSAttributedString(string: "Enter first name", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        lastNameTF.attributedPlaceholder =
        NSAttributedString(string: "Enter last name", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        emailTF.attributedPlaceholder =
        NSAttributedString(string: "Email address", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        passwordTF.attributedPlaceholder =
        NSAttributedString(string: "Create password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        confirPasswordTF.attributedPlaceholder =
        NSAttributedString(string: "Re-enter password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        shadowGreen(Vw: btnSubmit, radius: 15)
        shadowGreen(Vw: firstNameTF, radius: 15)
        shadowGreen(Vw: lastNameTF, radius: 15)
        shadowGreen(Vw: emailTF, radius: 15)
        shadowGreen(Vw: passwordTF, radius: 15)
        shadowGreen(Vw: confirPasswordTF, radius: 15)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = ""
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.title = ""
    }
    
    func validateTextFields() -> Bool{
        
        if firstNameTF.text == "" {
            showSnackBar(message: "First name required", duration: .middle)
            return false
        } else if lastNameTF.text == "" {
            showSnackBar(message: "Last name required", duration: .middle)
            return false
        } else if emailTF.text == "" {
            showSnackBar(message: "Email required", duration: .middle)
            return false
        }else if passwordTF.text == "" {
            showSnackBar(message: "Password required", duration: .middle)
            return false
        }else if confirPasswordTF.text == "" {
            showSnackBar(message: "Confirm password required", duration: .middle)
            return false
        }
        if let email = emailTF.text {
            if !validateEmail(enteredEmail: email){
                showSnackBar(message: "Invalid Email", duration: .short)
                return false
            }
        }
        if let password = passwordTF.text, let confirmPassword = confirPasswordTF.text {
            if password != confirmPassword {
                showSnackBar(message: "Passwords do not match", duration: .short)
                return false
            }
        }
        return true
    }
    
    @IBAction func registerBtnTapped(_ sender: UIButton) {
        if validateTextFields() {
            if  let password = confirPasswordTF.text, let email = emailTF.text {
                let userName = "\(firstNameTF.text ?? "") \(lastNameTF.text ?? "")"
                Remote.shared.registerUser(userName: userName, password: password, email: email) { userData in
                    if userData.requestStatus == Constants.successMsg {
                        let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
                        let vc = mainStoryBoard.instantiateViewController(withIdentifier: "LoginOtpVC") as! LoginOtpVC
                        vc.useType = .registration
                        vc.userID = userData.content?.first?.userregid
                        self.navigationController?.pushViewController(vc, animated: true)
                    } else {
                        showSnackBar(message: userData.error ?? "", duration: .middle)
                    }
                }
            }
            
        }
        
    }
    
}
