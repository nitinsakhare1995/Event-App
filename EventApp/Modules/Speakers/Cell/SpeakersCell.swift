//
//  SpeakersCell.swift
//  EventApp
//
//  Created by Nitin Sakhare on 23/04/22.
//

import UIKit
import Kingfisher

class SpeakersCell: UITableViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var imgSpeaker: UIImageView!
    @IBOutlet weak var lblSpeakerName: UILabel!
    @IBOutlet weak var lblDesignation: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        shadow(Vw: mainView, radius: 10)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configureCell(data: SpeakerContentModel?) {
        let url = URL(string: "\(data?.http_url ?? "")\(data?.profile_pic ?? "")")
        imgSpeaker.kf.setImage(with: url)
        lblSpeakerName.text = data?.name
        lblDesignation.text = data?.company_name
    }
    
}
