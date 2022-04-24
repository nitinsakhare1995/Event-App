//
//  LoginOtpVC.swift
//  EventApp
//
//  Created by Nitin Sakhare on 24/04/22.
//

import UIKit

class LoginOtpVC: UIViewController {

    @IBOutlet weak var btnSubmit: UIButton!
    @IBOutlet weak var otpTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        otpTF.layer.borderWidth = 1
        otpTF.layer.borderColor = UIColor.white.cgColor
        
        otpTF.setLeftPaddingPoints(10)
        otpTF.setRightPaddingPoints(10)
        
        otpTF.attributedPlaceholder =
        NSAttributedString(string: "Please enter your OTP", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        shadowGreen(Vw: btnSubmit, radius: 15)
        shadowGreen(Vw: otpTF, radius: 15)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
