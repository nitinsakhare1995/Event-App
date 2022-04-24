//
//  LoginVC.swift
//  EventApp
//
//  Created by Nitin Sakhare on 24/04/22.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        emailTF.layer.borderWidth = 1
        emailTF.layer.borderColor = UIColor.white.cgColor
        passwordTF.layer.borderWidth = 1
        passwordTF.layer.borderColor = UIColor.white.cgColor
        
        emailTF.setLeftPaddingPoints(10)
        emailTF.setRightPaddingPoints(10)
        
        emailTF.attributedPlaceholder =
        NSAttributedString(string: "Please enter your registered email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        passwordTF.setLeftPaddingPoints(10)
        passwordTF.setRightPaddingPoints(10)
        
        passwordTF.attributedPlaceholder =
        NSAttributedString(string: "Please enter your Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        shadowGreen(Vw: btnLogin, radius: 15)
        shadowGreen(Vw: emailTF, radius: 15)
        shadowGreen(Vw: passwordTF, radius: 15)
    }
    


}


extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
