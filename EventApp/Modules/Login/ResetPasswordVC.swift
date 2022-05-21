//
//  ResetPasswordVC.swift
//  EventApp
//
//  Created by Nitin Sakhare on 24/04/22.
//

import UIKit

class ResetPasswordVC: UIViewController {

    @IBOutlet weak var newPasswordTF: UITextField!
    @IBOutlet weak var confirmPasswordTF: UITextField!
    @IBOutlet weak var btnSubmit: UIButton!
    
    var useType: LoginSuccessType?
    var userId: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        newPasswordTF.layer.borderWidth = 1
        newPasswordTF.layer.borderColor = UIColor.white.cgColor
        confirmPasswordTF.layer.borderWidth = 1
        confirmPasswordTF.layer.borderColor = UIColor.white.cgColor
        
        newPasswordTF.setLeftPaddingPoints(10)
        newPasswordTF.setRightPaddingPoints(10)
        
        newPasswordTF.attributedPlaceholder =
        NSAttributedString(string: "Create new password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        confirmPasswordTF.setLeftPaddingPoints(10)
        confirmPasswordTF.setRightPaddingPoints(10)
        
        confirmPasswordTF.attributedPlaceholder =
        NSAttributedString(string: "Re-enter password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        shadowGreen(Vw: btnSubmit, radius: 15)
        shadowGreen(Vw: newPasswordTF, radius: 15)
        shadowGreen(Vw: confirmPasswordTF, radius: 15)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = ""
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationItem.title = ""
    }
    
    @IBAction func btnSubmitPassword(_ sender: UIButton) {
        if validateTextFields() {
            if let password = newPasswordTF.text, let userId = self.userId {
                Remote.shared.resetPassword(password: password, userId: userId) { userData in
                    if userData.requestStatus == Constants.successMsg {
                        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginSuccessVC") as! LoginSuccessVC
                        vc.useType = self.useType
                        self.navigationController?.pushViewController(vc, animated: true)
                    } else {
                        showSnackBar(message: userData.error ?? "", duration: .middle)
                    }
                }
            }
            
        }
    }
    
    func validateTextFields() -> Bool{
        
        if newPasswordTF.text == "" {
            showSnackBar(message: "New password required", duration: .middle)
            return false
        } else if newPasswordTF.text == "" {
            showSnackBar(message: "Confirm password required", duration: .middle)
            return false
        }
        if let password = newPasswordTF.text, let confirmPassword = confirmPasswordTF.text {
            if password != confirmPassword {
                showSnackBar(message: "Passwords do not match", duration: .short)
                return false
            }
        }
        return true
    }
    
    
}
