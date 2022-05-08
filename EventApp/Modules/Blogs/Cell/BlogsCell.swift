//
//  BlogsCell.swift
//  EventApp
//
//  Created by Nitin Sakhare on 24/04/22.
//

import UIKit

class BlogsCell: UITableViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var imgBlog: UIImageView!
    @IBOutlet weak var lblBolgTopic: UILabel!
    @IBOutlet weak var lblBlogReadTime: UILabel!
    @IBOutlet weak var lblCategoryName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        shadow(Vw: mainView, radius: 15)
    }

    func configureCell(data: BlogContentModel?) {
        let baseURL = Constants.baseImgURL
        let imgURL = data?.blog_image ?? ""
        let imgURLKF = URL(string: "\(baseURL)\(imgURL)")
        imgBlog.kf.setImage(with: imgURLKF)
        lblBolgTopic.text = data?.blog_topic
        lblCategoryName.text = data?.blog_category
    }
    
}
