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

}
