//
//  MapCell.swift
//  EventApp
//
//  Created by Nitin Sakhare on 30/04/22.
//

import UIKit

class MapCell: UITableViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblPhone: UILabel!
    @IBOutlet weak var lblLink: UILabel!
    @IBOutlet weak var imgAgenda: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        shadow(Vw: mainView, radius: 15)
    }
    
    func configureCell(data: AgendaContentModel?) {
        lblTitle.text = data?.agenda_category
        let baseURL = Constants.baseImgURL
        let imgURL = data?.agenda_image ?? ""
        let imgURLKF = URL(string: "\(baseURL)\(imgURL)")
        imgAgenda.kf.setImage(with: imgURLKF)
//        lblAddress.text = ""
//        lblPhone.text = ""
//        lblLink.text = ""
    }

    @IBAction func callOption(_ sender: UIButton) {
        
    }
    
    @IBAction func openLink(_ sender: UIButton) {
        
    }
    
}
