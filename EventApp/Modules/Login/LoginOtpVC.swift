//
//  LoginOtpVC.swift
//  EventApp
//
//  Created by Nitin Sakhare on 24/04/22.
//

import UIKit

class LoginOtpVC: UIViewController {
    
    @IBOutlet weak var btnSubmit: UIButton!
    @IBOutlet weak var lblTimer: UILabel!
    @IBOutlet weak var otpTF: UITextField!
    @IBOutlet weak var resendOtpView: UIView!
    
    var userID: Int?
    var useType: LoginSuccessType?
    var email: String?
    
    var timer = Timer()
    var second = 30
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        otpTF.layer.borderWidth = 1
        otpTF.layer.borderColor = UIColor.white.cgColor
        
        otpTF.setLeftPaddingPoints(10)
        otpTF.setRightPaddingPoints(10)
        
        otpTF.attributedPlaceholder =
        NSAttributedString(string: "Please enter OTP", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        shadowGreen(Vw: btnSubmit, radius: 15)
        shadowGreen(Vw: otpTF, radius: 15)
        
        startTimer()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationItem.title = ""
        timer.invalidate()
    }
    
    func startTimer() {
        otpTF.text = ""
        resendOtpView.isHidden = true
        self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.updateTimerInOTPLbl), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimerInOTPLbl() {
        second -= 1
        if second == 0 {
            timer.invalidate()
            lblTimer.isHidden = true
            resendOtpView.isHidden = false
            second = 30
        } else {
            lblTimer.isHidden = false
            lblTimer.text = "00:\(second)"
        }
    }
    
    @IBAction func submitOtpTapped(_ sender: UIButton) {
        if validateTextFields() {
            if let userID = self.userID, let otp = otpTF.text {
                Remote.shared.verifyOtp(userId: userID, otp: otp) { result in
                    if result.requestStatus == Constants.successMsg {
                        let mainStoryBoard = UIStoryboard(name: "Main", bundle: nil)
                        let vc = mainStoryBoard.instantiateViewController(withIdentifier: "LoginSuccessVC") as! LoginSuccessVC
                        vc.useType = self.useType
                        self.navigationController?.pushViewController(vc, animated: true)
                    } else {
                        showSnackBar(message: result.error ?? "", duration: .middle)
                    }
                    
                }
            }
        }
        
    }
    
    @IBAction func btnResendEmail(_ sender: UIButton) {
        if let email = self.email {
            print("Resend")
            startTimer()
        }
        
    }
    
    func validateTextFields() -> Bool{
        
        if otpTF.text == "" {
            showSnackBar(message: "OTP required", duration: .middle)
            return false
        }
        return true
    }
    
}
