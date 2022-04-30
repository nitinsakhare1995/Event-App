//
//  MapsVC.swift
//  EventApp
//
//  Created by Nitin Sakhare on 30/04/22.
//

import UIKit

class MapsVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar! {
        didSet{
            if let searchTextfield = self.searchBar.value(forKey: "searchField") as? UITextField  {
                searchTextfield.layer.borderColor = UIColor.darkGreen.cgColor
                searchTextfield.layer.borderWidth = 1
                searchTextfield.layer.cornerRadius = 18
                searchTextfield.backgroundColor = .white
                let placeholderAttributes = [NSAttributedString.Key.foregroundColor: UIColor.darkGreen, NSAttributedString.Key.font: R.font.gorditaRegular(size: 12)]
                let attributedPlaceholder = NSAttributedString(string: "Search: Venue, Event, Speaker", attributes: placeholderAttributes)
                searchTextfield.attributedPlaceholder = attributedPlaceholder
                (searchTextfield.leftView as? UIImageView)?.tintColor = .darkGreen
                searchTextfield.textColor = .darkGreen
                searchTextfield.font = R.font.gorditaRegular(size: 12)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "MapCell", bundle: nil), forCellReuseIdentifier: "MapCell")
        
        searchBar.backgroundImage = UIImage()
        
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

}

extension MapsVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MapCell", for: indexPath) as! MapCell
        cell.selectionStyle = .none
        return cell
    }
    
}

extension MapsVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "Maps", bundle: nil).instantiateViewController(withIdentifier: "MapDetailVC") as! MapDetailVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
