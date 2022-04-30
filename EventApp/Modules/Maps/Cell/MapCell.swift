//
//  MapCell.swift
//  EventApp
//
//  Created by Nitin Sakhare on 30/04/22.
//

import UIKit

class MapCell: UITableViewCell {

    @IBOutlet weak var mainView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        shadow(Vw: mainView, radius: 15)
    }


}
