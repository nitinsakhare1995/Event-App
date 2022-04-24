//
//  ProfileEventCell.swift
//  EventApp
//
//  Created by Nitin Sakhare on 24/04/22.
//

import UIKit

class ProfileEventCell: UICollectionViewCell {
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var gradientView: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        gradientView.backgroundColor = UIColor.fromGradientWithDirection(.topToBottom, frame: gradientView.frame, colors:  [.lightGreen, .darkGreen])
        shadow(Vw: mainView, radius: 20)
        
        lblTitle.text = "Hydrogen for life \n2022"
        
    }

}
