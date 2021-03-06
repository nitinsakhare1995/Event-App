//
//  MapGalleryCell.swift
//  EventApp
//
//  Created by Nitin Sakhare on 30/04/22.
//

import UIKit

class MapGalleryCell: UICollectionViewCell {
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var imgGallery: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        shadow(Vw: mainView, radius: 15)
    }

}
