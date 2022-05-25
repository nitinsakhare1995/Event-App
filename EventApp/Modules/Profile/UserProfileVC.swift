//
//  UserProfileVC.swift
//  EventApp
//
//  Created by Nitin Sakhare on 24/04/22.
//

import UIKit

class UserProfileVC: UIViewController {
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var userCardView: UIView!
    @IBOutlet weak var sessionsCollectionView: UICollectionView!
    @IBOutlet weak var eventsCollectionView: UICollectionView!
    @IBOutlet weak var resourcesCollectionView: UICollectionView!
    @IBOutlet weak var videosCollectionView: UICollectionView!
    @IBOutlet weak var imgUser: UIImageView!
    @IBOutlet weak var lblUsername: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblMobileNumber: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topView.roundCorners([.layerMaxXMaxYCorner, .layerMinXMaxYCorner], radius: 20)
        topView.backgroundColor = UIColor.fromGradientWithDirection(.topToBottom, frame: topView.frame, colors:  [.lightGreen, .darkGreen])
        shadow(Vw: userCardView, radius: 20)
        
        sessionsCollectionView.register(UINib(nibName: "SpeakersSessionsCell", bundle: nil), forCellWithReuseIdentifier: "SpeakersSessionsCell")
        eventsCollectionView.register(UINib(nibName: "ProfileEventCell", bundle: nil), forCellWithReuseIdentifier: "ProfileEventCell")
        resourcesCollectionView.register(UINib(nibName: "ProfileResourcesCell", bundle: nil), forCellWithReuseIdentifier: "ProfileResourcesCell")
        videosCollectionView.register(UINib(nibName: "HomeVideosCell", bundle: nil), forCellWithReuseIdentifier: "HomeVideosCell")
        
        sessionsCollectionView.delegate = self
        sessionsCollectionView.dataSource = self
        
        eventsCollectionView.delegate = self
        eventsCollectionView.dataSource = self
        
        resourcesCollectionView.delegate = self
        resourcesCollectionView.dataSource = self
        
        videosCollectionView.delegate = self
        videosCollectionView.dataSource = self
        
        getProfileData()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func getProfileData() {
        let userDefaults = UserDefaults.standard
        if let userId = userDefaults.string(forKey: "UDUserId") {
            Remote.shared.getProfileData(userId: userId) { userData in
//                let baseURL = Constants.baseImgURL
//                let imgURL = userData.content?.first?.banner_img ?? ""
//                let imgURLKF = URL(string: "\(baseURL)\(imgURL)")
//                self.imgUser.kf.setImage(with: imgURLKF)
                self.lblUsername.text = userData.content?.first?.fullname
                self.lblEmail.text = userData.content?.first?.email_id
                self.lblMobileNumber.text = userData.content?.first?.mobile
            }
        }
    }
    
}

extension UserProfileVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.sessionsCollectionView {
            return 5
        } else if collectionView == self.eventsCollectionView {
            return 5
        } else if collectionView == self.resourcesCollectionView {
            return 5
        } else {
            return 5
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.sessionsCollectionView {
            if let cell = sessionsCollectionView.dequeueReusableCell(withReuseIdentifier: R.reuseIdentifier.speakersSessionsCell, for: indexPath) as? SpeakersSessionsCell {
                return cell
            }
        } else if collectionView == self.eventsCollectionView {
            if let cell = eventsCollectionView.dequeueReusableCell(withReuseIdentifier: R.reuseIdentifier.profileEventCell, for: indexPath) as? ProfileEventCell {
                return cell
            }
        } else if collectionView == self.resourcesCollectionView {
            if let cell = resourcesCollectionView.dequeueReusableCell(withReuseIdentifier: R.reuseIdentifier.profileResourcesCell, for: indexPath) as? ProfileResourcesCell {
                return cell
            }
        } else {
            if let cell = videosCollectionView.dequeueReusableCell(withReuseIdentifier: R.reuseIdentifier.homeVideosCell, for: indexPath) as? HomeVideosCell {
                return cell
            }
        }
        return UICollectionViewCell()
    }
    
}

extension UserProfileVC: UICollectionViewDelegate {
    
}

extension UserProfileVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == self.sessionsCollectionView {
            let width = (self.view.frame.size.width - 60)
            let height = self.sessionsCollectionView.frame.size.height
            return CGSize(width: width, height: height)
        } else if collectionView == self.eventsCollectionView {
            let width = (self.view.frame.size.width - 70)
            let height = self.eventsCollectionView.frame.size.height
            return CGSize(width: width, height: height)
        } else if collectionView == self.resourcesCollectionView {
            let width = (self.view.frame.size.width - 60)
            let height = self.resourcesCollectionView.frame.size.height
            return CGSize(width: width, height: height)
        } else {
            let width = (self.view.frame.size.width - 100)
            let height = self.videosCollectionView.frame.size.height
            return CGSize(width: width, height: height)
        }
    }
    
}
