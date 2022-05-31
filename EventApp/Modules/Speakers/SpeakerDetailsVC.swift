//
//  SpeakerDetailsVC.swift
//  EventApp
//
//  Created by Nitin Sakhare on 23/04/22.
//

import UIKit

class SpeakerDetailsVC: UIViewController {
    
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var speakerView: UIView!
    @IBOutlet weak var descriptionView: UIView!
    @IBOutlet weak var videosCollectionView: UICollectionView!
    @IBOutlet weak var sessionsCollectionView: UICollectionView!
    @IBOutlet weak var imgSpeaker: UIImageView!
    @IBOutlet weak var lblSpeakerName: UILabel!
    @IBOutlet weak var lblProfession: UILabel!
    @IBOutlet weak var txtDescription: UITextView!
    
    var speakerId: String?
    var data: SpeakerDetail0Model?
    var sessionData = [SpeakerDetailSessionspeakerDataModel]()
    var featuredVideos = [VideoContentModel]()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        topView.roundCorners([.layerMaxXMaxYCorner, .layerMinXMaxYCorner], radius: 20)
        topView.backgroundColor = UIColor.fromGradientWithDirection(.topToBottom, frame: topView.frame, colors:  [.lightGreen, .darkGreen])
        shadow(Vw: speakerView, radius: 20)
        shadow(Vw: descriptionView, radius: 20)
        
        
        videosCollectionView.register(UINib(nibName: "HomeVideosCell", bundle: nil), forCellWithReuseIdentifier: "HomeVideosCell")
        sessionsCollectionView.register(UINib(nibName: "SpeakersSessionsCell", bundle: nil), forCellWithReuseIdentifier: "SpeakersSessionsCell")
        
        videosCollectionView.delegate = self
        videosCollectionView.dataSource = self
        
        sessionsCollectionView.delegate = self
        sessionsCollectionView.dataSource = self
        
        getSpeakerDetails()
        getFeaturedVideoList()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.title = ""
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func getFeaturedVideoList() {
        Remote.shared.getVideoList(id: VideoType.featuredVideos.rawValue) { userData in
            self.featuredVideos = userData.content ?? []
            DispatchQueue.main.async {
                self.videosCollectionView.reloadData()
            }
        }
    }
    
    func getSpeakerDetails() {
        if let speakerId = self.speakerId {
            Remote.shared.getSpeakerDetails(speakerId: speakerId) { userData in
                self.data = userData.content?.SpeakerDetail0Model
                self.sessionData = userData.content?.sessionspeakerData ?? []
                DispatchQueue.main.async {
                    self.sessionsCollectionView.reloadData()
                }
                self.lblSpeakerName.text = self.data?.name
                self.lblProfession.text = self.data?.speaker_profession
                let baseImgURL = Constants.baseImgURL
                let imgURL = self.data?.profile_pic ?? ""
                let imgURLKF = URL(string: "\(baseImgURL)\(imgURL)")
                self.imgSpeaker.kf.setImage(with: imgURLKF)
                self.txtDescription.text = self.data?.speaker_description
            }
        }
    }
    
    @IBAction func btnGobackTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnLinkedinTapped(_ sender: UIButton) {
        let urlString = self.data?.speaker_linkedin ?? ""
        if let url = URL(string: urlString), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
    
    @IBAction func btnFacebookTapped(_ sender: UIButton) {
        let urlString = self.data?.speaker_facebook ?? ""
        if let url = URL(string: urlString), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
    
    @IBAction func btnTwitterTapped(_ sender: UIButton) {
        let urlString = self.data?.speaker_twitter ?? ""
        if let url = URL(string: urlString), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
    
    @IBAction func btnWeblinkTapped(_ sender: UIButton) {
        let urlString = self.data?.speaker_websitelink ?? ""
        if let url = URL(string: urlString), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
    
    
}

extension SpeakerDetailsVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.videosCollectionView {
            return self.featuredVideos.count
        } else {
            return self.sessionData.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.videosCollectionView {
            if let cell = videosCollectionView.dequeueReusableCell(withReuseIdentifier: R.reuseIdentifier.homeVideosCell, for: indexPath) as? HomeVideosCell {
                cell.configureCell(data: self.featuredVideos[indexPath.row], isVideoList: false)
                return cell
            }
        } else {
            if let cell = sessionsCollectionView.dequeueReusableCell(withReuseIdentifier: R.reuseIdentifier.speakersSessionsCell, for: indexPath) as? SpeakersSessionsCell {
                cell.configureCell(data: self.sessionData[indexPath.item])
                return cell
            }
        }
        return UICollectionViewCell()
    }
    
}

extension SpeakerDetailsVC: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.videosCollectionView {
            let urlString = self.featuredVideos[indexPath.row].video_url ?? ""
            if let url = URL(string: urlString), UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
            }
        } else if collectionView == self.sessionsCollectionView {
            let vc = UIStoryboard(name: "User", bundle: nil).instantiateViewController(withIdentifier: "SessionReminderBottomSheet") as! SessionReminderBottomSheet
            vc.speakerController = self
            vc.speakerId = self.speakerId
            vc.sessionid = self.sessionData[indexPath.item].session_id
            vc.speakerData = self.data
            self.openBottomSheet(sheetSize: [.fixed(230)], viewController: vc)
        }
    }
    
}


extension SpeakerDetailsVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.videosCollectionView {
            let width = (self.view.frame.size.width - 100)
            let height = self.videosCollectionView.frame.size.height
            return CGSize(width: width, height: height)
        } else {
            let width = (self.view.frame.size.width - 60)
            let height = self.sessionsCollectionView.frame.size.height
            return CGSize(width: width, height: height)
        }
    }
    
}
