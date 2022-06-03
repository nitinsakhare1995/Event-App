//
//  SpeakersSessionsCell.swift
//  EventApp
//
//  Created by Nitin Sakhare on 23/04/22.
//

import UIKit

class SpeakersSessionsCell: UICollectionViewCell {
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var verticalGradView: UIView!
    @IBOutlet weak var horizontalGradView: UIView!
    @IBOutlet weak var lblPanel: UILabel!
    @IBOutlet weak var lblTime: UILabel!
//    @IBOutlet weak var lblSessionNme: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        shadow(Vw: mainView, radius: 10)
        verticalGradView.backgroundColor = UIColor.fromGradientWithDirection(.topToBottom, frame: verticalGradView.frame, colors:  [.lightGreen, .darkGreen])
        horizontalGradView.backgroundColor = UIColor.fromGradientWithDirection(.topToBottom, frame: horizontalGradView.frame, colors:  [.lightGreen, .darkGreen])
        
    }
    
    func configureCell(data: SpeakerDetailSessionspeakerDataModel?) {
//        lblSessionNme.text = "Session \(data?.session_id ?? "")"
        let sessionTitle = data?.session_title ?? ""
        let sessionTime = data?.session_time ?? ""
        let panelText = "Session name  \(sessionTitle)".attributedStringWithColor(["\(sessionTitle)"], color: UIColor.darkGreen, font: R.font.gorditaBold(size: 12.0)!)
        let timeText = "Time  \(sessionTime)".attributedStringWithColor(["\(sessionTime)"], color: UIColor.darkGreen, font: R.font.gorditaBold(size: 12.0)!)

        lblPanel.attributedText = panelText
        lblTime.attributedText = timeText
        
    }
    
    func configureProfileSessionCell(data: SessionsReminderContentModel?) {
//        lblSessionNme.text = "Session \(data?.sessionid ?? "")"
        let sessionTitle = data?.session_title ?? ""
        let sessionTime = data?.session_time ?? ""
        let panelText = "Session name  \(sessionTitle)".attributedStringWithColor(["\(sessionTitle)"], color: UIColor.darkGreen, font: R.font.gorditaBold(size: 12.0)!)
        let timeText = "Time  \(sessionTime)".attributedStringWithColor(["\(sessionTime)"], color: UIColor.darkGreen, font: R.font.gorditaBold(size: 12.0)!)

        lblPanel.attributedText = panelText
        lblTime.attributedText = timeText
        
    }
    
}


