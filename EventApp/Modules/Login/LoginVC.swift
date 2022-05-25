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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = ""
        navigationController?.setNavigationBarHidden(false, animated: true)
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.title = ""
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func loginUser() {
        if validateTextFields() {
            if let email = emailTF.text, let password = passwordTF.text {
                Remote.shared.login(email: email, password: password) { userData in
                    if userData.requestStatus == Constants.successMsg {
                        let userDefault = UserDefaults.standard
                        userDefault.set(true, forKey: "isLoggedIn")
                        userDefault.set(userData.content?.first?.userregid, forKey: "UDUserId")
                        userDefault.synchronize()
                        let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
                        let vc = mainStoryBoard.instantiateViewController(withIdentifier: "rootController") as! SideMenuRootVC
                        self.switchRootViewController(rootViewController: vc, animated: true, completion: nil)
                    } else {
                        showSnackBar(message: userData.error ?? "", duration: .middle)
                    }
                }
            }
        }
    }
    
    func switchRootViewController(rootViewController: UIViewController, animated: Bool, completion: (() -> Void)?) {
        guard let window = UIApplication.shared.keyWindow else { return }
        if animated {
            UIView.transition(with: window, duration: 0.5, options: .transitionCrossDissolve, animations: {
                let oldState: Bool = UIView.areAnimationsEnabled
                UIView.setAnimationsEnabled(false)
                window.rootViewController = rootViewController
                UIView.setAnimationsEnabled(oldState)
            }, completion: { (finished: Bool) -> () in
                if (completion != nil) {
                    completion!()
                }
            })
        } else {
            window.rootViewController = rootViewController
        }
    }
    
    @IBAction func openForgotPasswordScreen(_ sender: UIButton) {
        let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = mainStoryBoard.instantiateViewController(withIdentifier: "ForgotPasswordVC") as! ForgotPasswordVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func validateTextFields() -> Bool{
        
        if emailTF.text == "" {
            showSnackBar(message: "Email required", duration: .middle)
            return false
        }else if passwordTF.text == "" {
            showSnackBar(message: "Password required", duration: .middle)
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
    
    @IBAction func btnLoginuserTapped(_ sender: UIButton) {
        self.loginUser()
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
