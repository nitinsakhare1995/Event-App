//
//  HomeVideosCell.swift
//  EventApp
//
//  Created by Nitin Sakhare on 23/04/22.
//

import UIKit

class HomeVideosCell: UICollectionViewCell {

    @IBOutlet weak var mainView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        shadow(Vw: mainView)
        
    }

}
