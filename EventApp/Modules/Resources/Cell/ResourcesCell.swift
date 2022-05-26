//
//  ResourcesCell.swift
//  EventApp
//
//  Created by Nitin Sakhare on 23/04/22.
//

import UIKit

class ResourcesCell: UITableViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var lblName: UILabel!
    
    var saveResource: (() -> ()) = {}
    
    override func awakeFromNib() {
        super.awakeFromNib()
        shadow(Vw: mainView, radius: 10)
    }
    
    @IBAction func btnSaveTapped(_ sender: UIButton) {
        saveResource()
    }
    
}
