//
//  SessionsCell.swift
//  EventApp
//
//  Created by Nitin Sakhare on 08/05/22.
//

import UIKit

class SessionsCell: UITableViewCell {
    
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configureCell(data: SessionsContentModel?) {
        lblTime.text = data?.session_time
        lbTitle.text = data?.session_title
    }
    
}
