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
    
}
