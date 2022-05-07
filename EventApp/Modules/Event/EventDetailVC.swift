//
//  EventDetailVC.swift
//  EventApp
//
//  Created by Nitin Sakhare on 30/04/22.
//

import UIKit
import UIGradient

class EventDetailVC: UIViewController {
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var btEvent: UIButton!
    @IBOutlet weak var btFuture: UIButton!
    @IBOutlet weak var btVenue: UIButton!
    @IBOutlet weak var descView: UIView!
    @IBOutlet weak var bottomDescView: UIView!
    @IBOutlet weak var galleryCollectionView: UICollectionView!
    
    var eventId: Int?
    var galleryData = [EventDetail1Model]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        galleryCollectionView.delegate = self
        galleryCollectionView.dataSource = self
        galleryCollectionView.register(UINib(nibName: "MapGalleryCell", bundle: nil), forCellWithReuseIdentifier: "MapGalleryCell")
        
        
        topView.roundCorners([.layerMaxXMaxYCorner, .layerMinXMaxYCorner], radius: 20)
        topView.backgroundColor = UIColor.fromGradientWithDirection(.topToBottom, frame: topView.frame, colors:  [.lightGreen, .darkGreen])
        shadow(Vw: descView, radius: 20)
        shadow(Vw: bottomDescView, radius: 20)
       
        getEventDetail()
        
        setEventButton()
        
    }
    
    func getEventDetail() {
        Remote.shared.getEventDetails(eventId: 1) { userData in
            self.galleryData = userData.content?.eventtabImages?.event1 ?? []
            DispatchQueue.main.async {
                self.galleryCollectionView.reloadData()
            }
            
        }
    }
    
    func setEventButton() {
        btEvent.backgroundColor = UIColor.darkGreen
        btEvent.setTitleColor(.white, for: .normal)
        btEvent.layer.cornerRadius = 25
        shadow(Vw: btEvent, radius: 25)
        
        btFuture.backgroundColor = UIColor.white
        btFuture.setTitleColor(.darkGreen, for: .normal)
        btFuture.layer.cornerRadius = 25
        removeShadow(Vw: btFuture, radius: 0)
        
        btVenue.backgroundColor = UIColor.white
        btVenue.setTitleColor(.darkGreen, for: .normal)
        btVenue.layer.cornerRadius = 25
        removeShadow(Vw: btVenue, radius: 0)
    }
    
    func setFutureButton() {
        btEvent.backgroundColor = UIColor.white
        btEvent.setTitleColor(.darkGreen, for: .normal)
        btEvent.layer.cornerRadius = 25
        removeShadow(Vw: btEvent, radius: 0)
        
        btFuture.backgroundColor = UIColor.darkGreen
        btFuture.setTitleColor(.white, for: .normal)
        btFuture.layer.cornerRadius = 25
        shadow(Vw: btFuture, radius: 25)
        
        btVenue.backgroundColor = UIColor.white
        btVenue.setTitleColor(.darkGreen, for: .normal)
        btVenue.layer.cornerRadius = 25
        removeShadow(Vw: btVenue, radius: 0)
    }
    
    func setVenueButton() {
        btEvent.backgroundColor = UIColor.white
        btEvent.setTitleColor(.darkGreen, for: .normal)
        btEvent.layer.cornerRadius = 25
        removeShadow(Vw: btEvent, radius: 0)
        
        btFuture.backgroundColor = UIColor.white
        btFuture.setTitleColor(.darkGreen, for: .normal)
        btFuture.layer.cornerRadius = 25
        removeShadow(Vw: btFuture, radius: 0)
        
        btVenue.backgroundColor = UIColor.darkGreen
        btVenue.setTitleColor(.white, for: .normal)
        btVenue.layer.cornerRadius = 25
        shadow(Vw: btVenue, radius: 25)
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
    
    @IBAction func btnGoBackTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func showEventTapped(_ sender: UIButton) {
        setEventButton()
    }
    
    @IBAction func showFutureTapped(_ sender: UIButton) {
        setFutureButton()
    }
    
    @IBAction func showVenueTapped(_ sender: UIButton) {
        setVenueButton()
    }
}

extension EventDetailVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return galleryData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = galleryCollectionView.dequeueReusableCell(withReuseIdentifier: "MapGalleryCell", for: indexPath) as! MapGalleryCell
        let baseImgURL = Constants.baseImgURL
        let imgURL = self.galleryData[indexPath.row].eventgallery_pic ?? ""
        let imgURLKF = URL(string: "\(baseImgURL)\(imgURL)")
        cell.imgGallery.kf.setImage(with: imgURLKF)
        return cell
    }
}

extension EventDetailVC: UICollectionViewDelegate {
    
}

extension EventDetailVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (self.view.frame.size.width - 120)
        let height = self.galleryCollectionView.frame.size.height
        return CGSize(width: width, height: height)
    }
    
}
