//
//  SponsorsCell.swift
//  EventApp
//
//  Created by Nitin Sakhare on 23/04/22.
//

import UIKit

class SponsorsCell: UITableViewCell {
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var imgSponsor: UIImageView!
    @IBOutlet weak var lblLinl: UILabel!
    @IBOutlet weak var lblCompanyName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        shadow(Vw: mainView, radius: 20)
        
    }
    
    func configureCell(data: SponsorsContentModel?) {
        lblLinl.text = data?.websitelink
        lblCompanyName.text = data?.company_name
        let baseURL = Constants.baseImgURL
        let imgURL = data?.sponsor_logo ?? ""
        let imgURLKF = URL(string: "\(baseURL)\(imgURL)")
        imgSponsor.kf.setImage(with: imgURLKF)
    }
    
}
