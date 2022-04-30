//
//  HomeSpeakersCell.swift
//  EventApp
//
//  Created by Nitin Sakhare on 23/04/22.
//

import UIKit

class HomeSpeakersCell: UICollectionViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var lblSpeakerName: UILabel!
    @IBOutlet weak var lblDesignation: UILabel!
    @IBOutlet weak var imgSpeaker: UIImageView!
    @IBOutlet weak var lbEventType: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        shadow(Vw: mainView, radius: 10)
    }
    
    func configureCell(data: SpeakerContentModel?) {
        let imgURL = URL(string: "\(data?.http_url ?? "")\(data?.profile_pic ?? "")")
        imgSpeaker.kf.setImage(with: imgURL)
        lblSpeakerName.text = data?.name
        lblDesignation.text = data?.designation
    }
    

}
