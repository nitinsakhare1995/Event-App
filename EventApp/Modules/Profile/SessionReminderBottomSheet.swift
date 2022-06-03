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
    @IBOutlet weak var tbleView: UITableView!
    @IBOutlet weak var tableHeight: NSLayoutConstraint!
    
    var speakerData: SpeakerDetail0Model?
    var sessionid: String?
    var speakerId: String?
    var speakerName: String?
    var speakerDesignataion: String?
    var profilePicUrl: String?
    var speakerController: SpeakerDetailsVC?
    var height: CGFloat?
    var panellistData: [PanellistData]?
    var sessiontitle: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnCancel.layer.borderColor = UIColor.lightGray.cgColor
        btnCancel.layer.borderWidth = 1
        btnCancel.layer.cornerRadius = 10
        
        lblname.text = sessiontitle
        lblProfession.text = "Speaker Name: \(speakerData?.name ?? speakerName ?? "")"
        
        
        let baseImgURL = Constants.baseImgURL
        let imgURL = self.speakerData?.profile_pic ?? self.profilePicUrl
        let imgURLKF = URL(string: "\(baseImgURL)\(imgURL ?? "")")
        self.imgProfile.kf.setImage(with: imgURLKF)
        
        btnSetReminder.layer.cornerRadius = 10
        
        tbleView.delegate = self
        tbleView.dataSource = self
        
        tbleView.register(UINib(nibName: "PanelistCell", bundle: nil), forCellReuseIdentifier: "PanelistCell")
        var height = 70
        
        if let dataCount = self.panellistData?.count {
            height += dataCount * 40
        }
        
        
        if self.panellistData == nil {
            tableHeight.constant = CGFloat(100)
        } else {
            tableHeight.constant = CGFloat(height)
        }
       
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

extension SessionReminderBottomSheet: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.panellistData?.count == 0 {
            return 1
        } else {
            return self.panellistData?.count ?? 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PanelistCell", for: indexPath) as! PanelistCell
        cell.selectionStyle = .none
        if self.panellistData?.count == 0 {
            cell.lblName.text = "No Panellist found"
        } else {
            if self.panellistData?[indexPath.row].panellist_name == nil {
                cell.lblName.text = "No Panellist found"
            } else {
                cell.lblName.text = self.panellistData?[indexPath.row].panellist_name
            }
        }
        
        return cell
    }
    
}
