//
//  LoginSuccessVC.swift
//  EventApp
//
//  Created by Nitin Sakhare on 24/04/22.
//

import UIKit

enum LoginSuccessType {
    case password
    case registration
}

class LoginSuccessVC: UIViewController {
    
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var lblMessage: UILabel!
    
    var useType: LoginSuccessType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shadowGreen(Vw: btnLogin, radius: 15)
        
        if useType == .password {
            lblMessage.text = "Password changed successfully!"
        } else {
            lblMessage.text = "Registration successful!"
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = ""
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.title = ""
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    @IBAction func returnToLoginTapped(_ sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}
