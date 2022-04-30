//
//  HomeVideosCell.swift
//  EventApp
//
//  Created by Nitin Sakhare on 23/04/22.
//

import UIKit

class HomeVideosCell: UICollectionViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var imgThumbnail: UIImageView!
    @IBOutlet weak var lblVideoTitle: UILabel!
    @IBOutlet weak var lblVideoAuthor: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        shadow(Vw: mainView, radius: 10)
        
    }
    
    func configureCell(data: VideoContentModel?) {
        let imgURL = URL(string: "\(data?.http_url ?? "")\(data?.video_thumbnail ?? "")")
        imgThumbnail.kf.setImage(with: imgURL)
        lblVideoTitle.text = data?.video_title
    }

}
