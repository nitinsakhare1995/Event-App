//
//  ForgotPasswordVC.swift
//  EventApp
//
//  Created by Nitin Sakhare on 24/04/22.
//

import UIKit

class ForgotPasswordVC: UIViewController {

    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var btnSubmit: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTF.layer.borderWidth = 1
        emailTF.layer.borderColor = UIColor.white.cgColor
        
        emailTF.setLeftPaddingPoints(10)
        emailTF.setRightPaddingPoints(10)
        
        emailTF.attributedPlaceholder =
        NSAttributedString(string: "Please enter your registered email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        shadowGreen(Vw: btnSubmit, radius: 15)
        shadowGreen(Vw: emailTF, radius: 15)

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = ""
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationItem.title = ""
    }

    @IBAction func submitBtnTapped(_ sender: UIButton) {
        if validateTextFields() {
            if let email = self.emailTF.text {
                Remote.shared.forgotPassword(email: email) { userData in
                    if userData.requestStatus == Constants.successMsg {
                        let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
                        let vc = mainStoryBoard.instantiateViewController(withIdentifier: "LoginOtpVC") as! LoginOtpVC
                        vc.email = email
                        if let userID = userData.content?.first?.userregid {
                            vc.userID = userID
                        }
                        vc.useType = .password
                        self.navigationController?.pushViewController(vc, animated: true)
                    } else {
                        showSnackBar(message: userData.error ?? "", duration: .middle)
                    }
                }
            }
        }
    }
    
    func validateTextFields() -> Bool{
        
        if emailTF.text == "" {
            showSnackBar(message: "Email required", duration: .middle)
            return false
        }
        if let email = emailTF.text {
            if !validateEmail(enteredEmail: email){
                showSnackBar(message: "Invalid Email", duration: .short)
                return false
            }
        }
        return true
    }
    
}
