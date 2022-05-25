//
//  MapDetailVC.swift
//  EventApp
//
//  Created by Nitin Sakhare on 30/04/22.
//

import UIKit

class MapDetailVC: UIViewController {
    
    @IBOutlet weak var cardInfoView: UIView!
    @IBOutlet weak var navigationView: UIView!
    @IBOutlet weak var directionsView: UIView!
    @IBOutlet weak var galleryCollectionView: UICollectionView!
    @IBOutlet weak var imgBanner: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblWebsite: UILabel!
    @IBOutlet weak var lblPhone: UILabel!
    
    var gallery = [MapDetailGalleryImagesModel]()
    var content: MapDetailContentModel?
    var agendaId: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        shadow(Vw: cardInfoView, radius: 15)
        shadow(Vw: navigationView, radius: 15)
        shadow(Vw: directionsView, radius: 15)
        
        galleryCollectionView.delegate = self
        galleryCollectionView.dataSource = self
        galleryCollectionView.register(UINib(nibName: "MapGalleryCell", bundle: nil), forCellWithReuseIdentifier: "MapGalleryCell")
        
        getData()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = ""
        
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
    
    func getData() {
        if let agendaId = self.agendaId {
            Remote.shared.getMapDetails(eventId: "1", agendaId: agendaId) { userData in
                self.gallery = userData.content?.galleryImages ?? []
                DispatchQueue.main.async {
                    self.galleryCollectionView.reloadData()
                }
                self.content = userData.content
                let baseURL = Constants.baseImgURL
                let imgURL = userData.content?.map0?.banner_img ?? ""
                let imgURLKF = URL(string: "\(baseURL)\(imgURL)")
                self.imgBanner.kf.setImage(with: imgURLKF)
                self.lblName.text = userData.content?.map0?.agenda_category ?? ""
                self.lblAddress.text = userData.content?.map0?.agenda_address ?? ""
                self.lblWebsite.text = userData.content?.map0?.agenda_websiteurl ?? ""
                self.lblPhone.text = userData.content?.map0?.agenda_phone ?? ""
            }
        }
    }
    
    @IBAction func opneNavigation(_ sender: UIButton) {
        showlocationAction()
    }
    
    @IBAction func openDirection(_ sender: UIButton) {
        showlocationAction()
    }
    
    func showlocationAction() {
        let address = self.content?.map0?.agenda_address ?? ""
        let mapURLStr = String(format: "https://maps.google.com/?q=\(address)")
        if let url = URL(string: mapURLStr.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!) {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
            }
        }
    }
    
    @IBAction func openLink(_ sender: UIButton) {
        let urlString = self.content?.map0?.agenda_websiteurl ?? ""
        if let url = URL(string: urlString), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
    
}

extension MapDetailVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.gallery.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = galleryCollectionView.dequeueReusableCell(withReuseIdentifier: "MapGalleryCell", for: indexPath) as! MapGalleryCell
        let baseURL = Constants.baseImgURL
        let imgURL = self.gallery[indexPath.row].gallery_img ?? ""
        let imgURLKF = URL(string: "\(baseURL)\(imgURL)")
        cell.imgGallery.kf.setImage(with: imgURLKF)
        return cell
    }
}

extension MapDetailVC: UICollectionViewDelegate {
    
}

extension MapDetailVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (self.view.frame.size.width - 120)
        let height = self.galleryCollectionView.frame.size.height
        return CGSize(width: width, height: height)
    }
    
}
