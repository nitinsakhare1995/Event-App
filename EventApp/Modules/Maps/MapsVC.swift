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
                searchTextfield.layer.cornerRadius = 10
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
    
    var data = [AgendaContentModel]()
    var searchData = [AgendaContentModel]()
    var searching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "MapCell", bundle: nil), forCellReuseIdentifier: "MapCell")
        
        searchBar.backgroundImage = UIImage()
        searchBar.delegate = self
        getMapList()
        
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
    
    func getMapList() {
        Remote.shared.getAgendaList(eventId: 1) { userData in
            self.data = userData.content ?? []
            self.searchData = userData.content ?? []
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
}

extension MapsVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return self.searchData.count
        } else {
            return self.data.count
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MapCell", for: indexPath) as! MapCell
        cell.selectionStyle = .none
        if searching {
            cell.configureCell(data: self.searchData[indexPath.row])
        } else {
            cell.configureCell(data: self.data[indexPath.row])
        }
        return cell
    }
    
}

extension MapsVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "Maps", bundle: nil).instantiateViewController(withIdentifier: "MapDetailVC") as! MapDetailVC
        if searching {
            vc.agendaId = self.searchData[indexPath.row].agenda_id
        } else {
            vc.agendaId = self.data[indexPath.row].agenda_id
        }
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension MapsVC: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == "" {
            searching = false
            view.endEditing(true)
            self.tableView.reloadData()
        } else {
            searching = true
            let searchText = searchText.lowercased()
            searchData = self.data.filter ({$0.agenda_category?.lowercased().range(of: searchText.lowercased()) != nil})
            self.tableView.reloadData()
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text = ""
        self.tableView.reloadData()
        self.navigationItem.titleView = nil
    }
    
}
