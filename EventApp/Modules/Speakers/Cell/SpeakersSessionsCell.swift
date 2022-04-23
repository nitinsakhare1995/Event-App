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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        shadow(Vw: mainView, radius: 10)
        verticalGradView.backgroundColor = UIColor.fromGradientWithDirection(.topToBottom, frame: verticalGradView.frame, colors:  [.lightGreen, .darkGreen])
        horizontalGradView.backgroundColor = UIColor.fromGradientWithDirection(.topToBottom, frame: horizontalGradView.frame, colors:  [.lightGreen, .darkGreen])
                
        let panelText = "Panel  “Investing in Hydrogen”".attributedStringWithColor(["“Investing in Hydrogen”"], color: UIColor.darkGreen, font: R.font.gorditaBold(size: 12.0)!)
        let timeText = "Time  15:40 pm".attributedStringWithColor(["15:40 pm"], color: UIColor.darkGreen, font: R.font.gorditaBold(size: 12.0)!)

        lblPanel.attributedText = panelText
        lblTime.attributedText = timeText
        
        
    }
    
}


