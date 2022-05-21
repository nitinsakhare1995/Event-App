//
//  BlogDetailVC.swift
//  EventApp
//
//  Created by Nitin Sakhare on 08/05/22.
//

import UIKit

class BlogDetailVC: UIViewController {
    
    @IBOutlet weak var imgBlog: UIImageView!
    @IBOutlet weak var lblBolgTopic: UILabel!
    @IBOutlet weak var blogDescription: UITextView!
    @IBOutlet weak var lblReadTime: UILabel!
    @IBOutlet weak var lblUploadedDate: UILabel!
    @IBOutlet weak var lblAuthor: UILabel!
    
    var blogId: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBlogData()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = ""
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.title = ""
    }
    
    
    func setBlogData() {
        if let blogId = self.blogId {
            Remote.shared.getBlogDetail(blogId: blogId) { userData in
                let baseURL = Constants.baseImgURL
                let imgURL = userData.content?.first?.banner_img ?? ""
                let imgURLKF = URL(string: "\(baseURL)\(imgURL)")
                self.imgBlog.kf.setImage(with: imgURLKF)
                self.lblBolgTopic.text = userData.content?.first?.blog_topic ?? ""
                self.blogDescription.text = userData.content?.first?.blog_description ?? ""
                self.lblUploadedDate.text = userData.content?.first?.blog_date ?? ""
                self.lblAuthor.text = userData.content?.first?.blog_author ?? ""
            }
        }
    }
    
}
