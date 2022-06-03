//
//  SponsorsVC.swift
//  EventApp
//
//  Created by Nitin Sakhare on 23/04/22.
//

import UIKit

class SponsorsVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var vwMessaage: UIView!
    
    var data = [SponsorsContentModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "SponsorsCell", bundle: nil), forCellReuseIdentifier: "SponsorsCell")
      
        vwMessaage.layer.masksToBounds = true
        vwMessaage.layer.cornerRadius = 20
        
        getSponsorsList()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Sponsors"
        
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
    
    func getSponsorsList() {
        Remote.shared.getSponsors { userData in
            self.data = userData.content ?? []
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

}

extension SponsorsVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 310
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.sponsorsCell, for: indexPath) as? SponsorsCell {
            cell.selectionStyle = .none
            cell.configureCell(data: self.data[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
}

extension SponsorsVC: UITableViewDelegate {
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let urlString = self.data[indexPath.row].websitelink ?? ""
        if let url = URL(string: urlString), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
    
}
