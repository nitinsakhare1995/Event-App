//
//  LoginSuccessVC.swift
//  EventApp
//
//  Created by Nitin Sakhare on 24/04/22.
//

import UIKit

class LoginSuccessVC: UIViewController {

    @IBOutlet weak var btnLogin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shadowGreen(Vw: btnLogin, radius: 15)
    }
    


}
