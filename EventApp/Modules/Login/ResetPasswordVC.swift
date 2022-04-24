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
    
}
