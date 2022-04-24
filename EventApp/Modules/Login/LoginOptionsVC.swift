//
//  LoginOptionsVC.swift
//  EventApp
//
//  Created by Nitin Sakhare on 24/04/22.
//

import UIKit

class LoginOptionsVC: UIViewController {

    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnRegister: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.fromGradientWithDirection(.topToBottom, frame: self.view.frame, colors:  [.lightGreen, .darkGreen])

        shadowGreen(Vw: btnLogin, radius: 15)
        shadowGreen(Vw: btnRegister, radius: 15)
    }
    

}
