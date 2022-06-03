//
//  VideosTableCell.swift
//  EventApp
//
//  Created by Nitin Sakhare on 03/06/22.
//

import UIKit

class VideosTableCell: UITableViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var imgVideo: UIImageView!
    @IBOutlet weak var lblVideo: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        shadow(Vw: mainView, radius: 20)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    func configureCell(data: VideoContentModel?) {
        let imgURL = URL(string: "\(data?.http_url ?? "")\(data?.video_thumbnail ?? "")")
        imgVideo.kf.setImage(with: imgURL)
        lblVideo.text = data?.video_title
    }
    
}
