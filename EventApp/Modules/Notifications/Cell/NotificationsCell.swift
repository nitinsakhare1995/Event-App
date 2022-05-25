//
//  NotificationsCell.swift
//  EventApp
//
//  Created by Nitin Sakhare on 23/04/22.
//

import UIKit

class NotificationsCell: UITableViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblSubTitle: UILabel!
    @IBOutlet weak var lblTimeAgo: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        shadow(Vw: mainView, radius: 10)
    }

    func configureCell(data: NotificationContentModel?) {
        lblTitle.text = data?.notification_title
        lblSubTitle.text = data?.notification_subtitle
        lblTimeAgo.text = data?.time_ago
    }
    
}
