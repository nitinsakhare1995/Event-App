//
//  ViewController.swift
//  EventApp
//
//  Created by Nitin Sakhare on 22/04/22.
//

import UIKit
import UIGradient

class HomeVC: UIViewController {
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var agendaView: UIView!
    @IBOutlet weak var speakersView: UIView!
    @IBOutlet weak var mapsView: UIView!
    @IBOutlet weak var videosView: UIView!
    @IBOutlet weak var sponsorsView: UIView!
    @IBOutlet weak var blogsView: UIView!
    @IBOutlet weak var videosCollectionView: UICollectionView!
    @IBOutlet weak var speakersCollectionView: UICollectionView!
    
    var featuredVideos = [VideoContentModel]()
    var speakers = [SpeakerContentModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topView.roundCorners([.layerMaxXMaxYCorner, .layerMinXMaxYCorner], radius: 25)
        topView.backgroundColor = UIColor.fromGradientWithDirection(.topToBottom, frame: topView.frame, colors:  [.lightGreen, .darkGreen])
        shadow(Vw: agendaView, radius: 10)
        
        shadow(Vw: speakersView, radius: 10)
        shadow(Vw: mapsView, radius: 10)
        shadow(Vw: videosView, radius: 10)
        shadow(Vw: sponsorsView, radius: 10)
        shadow(Vw: blogsView, radius: 10)
        
        
        videosCollectionView.register(UINib(nibName: "HomeVideosCell", bundle: nil), forCellWithReuseIdentifier: "HomeVideosCell")
        speakersCollectionView.register(UINib(nibName: "HomeSpeakersCell", bundle: nil), forCellWithReuseIdentifier: "HomeSpeakersCell")
        
        videosCollectionView.delegate = self
        videosCollectionView.dataSource = self
        
        speakersCollectionView.delegate = self
        speakersCollectionView.dataSource = self
        
        getFeaturedVideoList()
        getSpeakersList()
        
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
    
    func getSpeakersList() {
        Remote.shared.getSpeakersList() { userData in
            self.speakers = userData.content ?? []
            DispatchQueue.main.async {
                self.speakersCollectionView.reloadData()
            }
        }
    }
    
    @IBAction func openSpeakersScreen(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Speakers", bundle: nil).instantiateViewController(withIdentifier: "SpeakersVC") as! SpeakersVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btnOpenNotificationsTapped(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Other", bundle: nil).instantiateViewController(withIdentifier: "NotificationsVC") as! NotificationsVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func openSponsorsScreen(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Other", bundle: nil).instantiateViewController(withIdentifier: "SponsorsVC") as! SponsorsVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func openBlogsScreen(_ sender: UIButton) {
        let vc = UIStoryboard(name: "User", bundle: nil).instantiateViewController(withIdentifier: "BlogsVC") as! BlogsVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func openVideosScreen(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Speakers", bundle: nil).instantiateViewController(withIdentifier: "VideosVC") as! VideosVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func openMapsScreen(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Maps", bundle: nil).instantiateViewController(withIdentifier: "MapsVC") as! MapsVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func openAgendaScreen(_ sender: UIButton) {
    }
    
}


extension HomeVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.videosCollectionView {
            return self.featuredVideos.count
        } else {
            return self.speakers.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.videosCollectionView {
            if let cell = videosCollectionView.dequeueReusableCell(withReuseIdentifier: R.reuseIdentifier.homeVideosCell, for: indexPath) as? HomeVideosCell {
                cell.configureCell(data: self.featuredVideos[indexPath.row])
                return cell
            }
        } else {
            if let cell = speakersCollectionView.dequeueReusableCell(withReuseIdentifier: R.reuseIdentifier.homeSpeakersCell, for: indexPath) as? HomeSpeakersCell {
                cell.configureCell(data: self.speakers[indexPath.row])
                return cell
            }
        }
        return UICollectionViewCell()
    }
    
}

extension HomeVC: UICollectionViewDelegate {
    
}


extension HomeVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.videosCollectionView {
            let width = (self.view.frame.size.width - 100)
            let height = self.videosCollectionView.frame.size.height
            return CGSize(width: width, height: height)
        } else {
            let width = (self.view.frame.size.width - 70)
            let height = self.speakersCollectionView.frame.size.height
            return CGSize(width: width, height: height)
        }
    }
    
}
