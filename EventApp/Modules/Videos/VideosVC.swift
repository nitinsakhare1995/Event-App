//
//  VideosVC.swift
//  EventApp
//
//  Created by Nitin Sakhare on 30/04/22.
//

import UIKit

class VideosVC: UIViewController {
    
    @IBOutlet weak var featuredVideosCollectionView: UICollectionView!
    @IBOutlet weak var sessionsVideoCollectionView: UICollectionView!
    @IBOutlet weak var speakerVideosCollectionView: UICollectionView!
    
    var featuredVideos = [VideoContentModel]()
    var sessionVideos = [VideoContentModel]()
    var speakerVideos = [VideoContentModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        featuredVideosCollectionView.register(UINib(nibName: "HomeVideosCell", bundle: nil), forCellWithReuseIdentifier: "HomeVideosCell")
        sessionsVideoCollectionView.register(UINib(nibName: "HomeVideosCell", bundle: nil), forCellWithReuseIdentifier: "HomeVideosCell")
        speakerVideosCollectionView.register(UINib(nibName: "HomeVideosCell", bundle: nil), forCellWithReuseIdentifier: "HomeVideosCell")
        
        featuredVideosCollectionView.delegate = self
        featuredVideosCollectionView.dataSource = self
        
        sessionsVideoCollectionView.delegate = self
        sessionsVideoCollectionView.dataSource = self
        
        speakerVideosCollectionView.delegate = self
        speakerVideosCollectionView.dataSource = self
        
        getFeaturedVideoList()
        getSessionVideoList()
        getSpeakerVideoList()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Videos"
        
        navigationController?.navigationBar.tintColor = .darkGreen
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.darkGreen,
                                                                   NSAttributedString.Key.font: R.font.gorditaMedium(size: 20.0)]
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.title = ""
    }
    
    func getFeaturedVideoList() {
        Remote.shared.getVideoList(id: VideoType.featuredVideos.rawValue) { userData in
            self.featuredVideos = userData.content ?? []
            DispatchQueue.main.async {
                self.featuredVideosCollectionView.reloadData()
            }
        }
    }
    
    func getSessionVideoList() {
        Remote.shared.getVideoList(id: VideoType.sessionVideo.rawValue) { userData in
            self.sessionVideos = userData.content ?? []
            DispatchQueue.main.async {
                self.sessionsVideoCollectionView.reloadData()
            }
        }
    }
    
    func getSpeakerVideoList() {
        Remote.shared.getVideoList(id: VideoType.speakerVideo.rawValue) { userData in
            self.speakerVideos = userData.content ?? []
            DispatchQueue.main.async {
                self.speakerVideosCollectionView.reloadData()
            }
        }
    }
    
}

extension VideosVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.featuredVideosCollectionView {
            return self.featuredVideos.count
        } else if collectionView == self.sessionsVideoCollectionView {
            return self.sessionVideos.count
        } else {
            return self.speakerVideos.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.featuredVideosCollectionView {
            if let cell = featuredVideosCollectionView.dequeueReusableCell(withReuseIdentifier: R.reuseIdentifier.homeVideosCell, for: indexPath) as? HomeVideosCell {
                cell.configureCell(data: self.featuredVideos[indexPath.row])
                return cell
            }
        } else if collectionView == self.sessionsVideoCollectionView {
            if let cell = sessionsVideoCollectionView.dequeueReusableCell(withReuseIdentifier: R.reuseIdentifier.homeVideosCell, for: indexPath) as? HomeVideosCell {
                cell.configureCell(data: self.sessionVideos[indexPath.row])
                return cell
            }
        } else {
            if let cell = speakerVideosCollectionView.dequeueReusableCell(withReuseIdentifier: R.reuseIdentifier.homeVideosCell, for: indexPath) as? HomeVideosCell {
                cell.configureCell(data: self.speakerVideos[indexPath.row])
                return cell
            }
        }
        return UICollectionViewCell()
    }
    
}

extension VideosVC: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.featuredVideosCollectionView {
            let urlString = self.featuredVideos[indexPath.row].video_url ?? ""
            if let url = URL(string: urlString), UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
            }
        } else if collectionView == self.sessionsVideoCollectionView {
            let urlString = self.sessionVideos[indexPath.row].video_url ?? ""
            if let url = URL(string: urlString), UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
            }
        } else {
            let urlString = self.speakerVideos[indexPath.row].video_url ?? ""
            if let url = URL(string: urlString), UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
            }
        }
    }
    
}


extension VideosVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.featuredVideosCollectionView {
            let width = (self.view.frame.size.width - 70)
            let height = self.featuredVideosCollectionView.frame.size.height
            return CGSize(width: width, height: height)
        } else if collectionView == self.sessionsVideoCollectionView {
            let width = (self.view.frame.size.width - 70)
            let height = self.sessionsVideoCollectionView.frame.size.height
            return CGSize(width: width, height: height)
        } else {
            let width = (self.view.frame.size.width - 70)
            let height = self.speakerVideosCollectionView.frame.size.height
            return CGSize(width: width, height: height)
        }
    }
    
}
