//
//  AgendaDetailsVC.swift
//  EventApp
//
//  Created by Nitin Sakhare on 08/05/22.
//

import UIKit

class AgendaDetailsVC: UIViewController {
    
    @IBOutlet weak var imgAgenda: UIImageView!
    @IBOutlet weak var topCardView: UIView!
    @IBOutlet weak var sessionsView: UIView!
    @IBOutlet weak var speakersView: UIView!
    @IBOutlet weak var virtualCardView: UIView!
    @IBOutlet weak var videosCollectionView: UICollectionView!
    @IBOutlet weak var lblAgendaName: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    
    var agendaId: String?
    var eventVideos = [VideoContentModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        videosCollectionView.register(UINib(nibName: "HomeVideosCell", bundle: nil), forCellWithReuseIdentifier: "HomeVideosCell")
        videosCollectionView.delegate = self
        videosCollectionView.dataSource = self
        
        shadow(Vw: topCardView, radius: 15)
        shadow(Vw: sessionsView, radius: 15)
        shadow(Vw: speakersView, radius: 15)
        shadow(Vw: virtualCardView, radius: 15)
        
        getAgendaDetails()
        getSessionVideoList()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = ""
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.title = ""
    }
    
    func getSessionVideoList() {
        Remote.shared.getVideoList(id: VideoType.sessionVideo.rawValue) { userData in
            self.eventVideos = userData.content ?? []
            DispatchQueue.main.async {
                self.videosCollectionView.reloadData()
            }
        }
    }
    
    func getAgendaDetails() {
        if let agendaId = self.agendaId {
            Remote.shared.getAgendaDetails(eventId: "1", agendaId: agendaId) { userData in
                let baseURL = Constants.baseImgURL
                let imgURL = userData.content?.first?.banner_img ?? ""
                let imgURLKF = URL(string: "\(baseURL)\(imgURL)")
                self.imgAgenda.kf.setImage(with: imgURLKF)
                self.lblAgendaName.text = userData.content?.first?.agenda_category ?? ""
                self.lblAddress.text = userData.content?.first?.agenda_address ?? ""
                self.lblDescription.text = userData.content?.first?.agenda_description ?? ""
            }
        }
        
    }
    
    @IBAction func openSessionsScreen(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Agenda", bundle: nil).instantiateViewController(withIdentifier: "SessionsVC") as! SessionsVC
        vc.agendaId = self.agendaId
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func openSpeakers(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Speakers", bundle: nil).instantiateViewController(withIdentifier: "SpeakersVC") as! SpeakersVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func opnNavigationScreen(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Maps", bundle: nil).instantiateViewController(withIdentifier: "MapDetailVC") as! MapDetailVC
        vc.agendaId = self.agendaId
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension AgendaDetailsVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.videosCollectionView {
            return self.eventVideos.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.videosCollectionView {
            if let cell = videosCollectionView.dequeueReusableCell(withReuseIdentifier: R.reuseIdentifier.homeVideosCell, for: indexPath) as? HomeVideosCell {
                cell.configureCell(data: self.eventVideos[indexPath.row])
                return cell
            }
        }
        return UICollectionViewCell()
    }
    
}

extension AgendaDetailsVC: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let urlString = self.eventVideos[indexPath.row].video_url ?? ""
        if let url = URL(string: urlString), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
}


extension AgendaDetailsVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.videosCollectionView {
            let width = (self.view.frame.size.width - 70)
            let height = self.videosCollectionView.frame.size.height
            return CGSize(width: width, height: height)
        }
        return CGSize()
    }
    
}
