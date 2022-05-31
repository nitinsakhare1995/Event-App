//
//  SessionReminderBottomSheet.swift
//  EventApp
//
//  Created by Nitin Sakhare on 31/05/22.
//

import UIKit
import TTGSnackbar

class SessionReminderBottomSheet: UIViewController {
    
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var btnSetReminder: UIButton!
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var lblname: UILabel!
    @IBOutlet weak var lblProfession: UILabel!
    
    var speakerData: SpeakerDetail0Model?
    var sessionid: String?
    var speakerId: String?
    var speakerName: String?
    var speakerDesignataion: String?
    var speakerController: SpeakerDetailsVC?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnCancel.layer.borderColor = UIColor.lightGray.cgColor
        btnCancel.layer.borderWidth = 1
        btnCancel.layer.cornerRadius = 10
        
        lblname.text = speakerData?.name ?? speakerName
        lblProfession.text = speakerData?.speaker_profession ?? speakerDesignataion
        
        let baseImgURL = Constants.baseImgURL
        let imgURL = self.speakerData?.profile_pic ?? ""
        let imgURLKF = URL(string: "\(baseImgURL)\(imgURL)")
        self.imgProfile.kf.setImage(with: imgURLKF)
        
        btnSetReminder.layer.cornerRadius = 10
        
    }
    
    @IBAction func btnCancelTapped(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    @IBAction func btnSetReminderTapped(_ sender: UIButton) {
        let userDefaults = UserDefaults.standard
        if let userId = userDefaults.string(forKey: "UDUserId"), let sessionid = self.sessionid, let spekaerId = self.speakerId {
            Remote.shared.setReminder(userId: userId, sessionId: sessionid, speakerId: spekaerId) { userData in
                if userData.requestStatus == "Success" {
                    self.dismiss(animated: true) {
                        showSnackBar(message: userData.msg ?? "", duration: .middle)
                    }
                } else {
                    showSnackBar(message: userData.msg ?? "", duration: .middle)
                }
            }
        }
    }
}
