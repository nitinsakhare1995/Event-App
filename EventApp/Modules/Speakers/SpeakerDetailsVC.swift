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
    
    @IBAction func btnGobackTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension SpeakerDetailsVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.videosCollectionView {
            return 5
        } else {
            return 5
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.videosCollectionView {
            if let cell = videosCollectionView.dequeueReusableCell(withReuseIdentifier: R.reuseIdentifier.homeVideosCell, for: indexPath) as? HomeVideosCell {
                return cell
            }
        } else {
            if let cell = sessionsCollectionView.dequeueReusableCell(withReuseIdentifier: R.reuseIdentifier.speakersSessionsCell, for: indexPath) as? SpeakersSessionsCell {
                return cell
            }
        }
        return UICollectionViewCell()
    }
    
}

extension SpeakerDetailsVC: UICollectionViewDelegate {
    
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
