//
//  BlogsCell.swift
//  EventApp
//
//  Created by Nitin Sakhare on 24/04/22.
//

import UIKit

class BlogsCell: UITableViewCell {

    @IBOutlet weak var mainView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        shadow(Vw: mainView, radius: 15)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
