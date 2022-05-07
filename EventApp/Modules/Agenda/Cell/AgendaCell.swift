//
//  AgendaCell.swift
//  EventApp
//
//  Created by Nitin Sakhare on 08/05/22.
//

import UIKit

class AgendaCell: UITableViewCell {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var lblAgenda: UILabel!
    @IBOutlet weak var imgAgenda: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        shadow(Vw: mainView, radius: 15)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configureCell(data: AgendaContentModel?) {
        lblAgenda.text = data?.agenda_category
        let baseURL = Constants.baseImgURL
        let imgURL = data?.agenda_image ?? ""
        let imgURLKF = URL(string: "\(baseURL)\(imgURL)")
        imgAgenda.kf.setImage(with: imgURLKF)
    }
    
}
