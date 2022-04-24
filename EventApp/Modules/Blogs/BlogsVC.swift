//
//  BlogsVC.swift
//  EventApp
//
//  Created by Nitin Sakhare on 24/04/22.
//

import UIKit

class BlogsVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!{
        didSet{
            if let searchTextfield = self.searchBar.value(forKey: "searchField") as? UITextField  {
                searchTextfield.layer.borderColor = UIColor.darkGreen.cgColor
                searchTextfield.layer.borderWidth = 1
                searchTextfield.layer.cornerRadius = 18
                searchTextfield.backgroundColor = .clear
                let placeholderAttributes = [NSAttributedString.Key.foregroundColor: UIColor.darkGreen, NSAttributedString.Key.font: R.font.gorditaRegular(size: 12)]
                let attributedPlaceholder = NSAttributedString(string: "Search: Topic, Category", attributes: placeholderAttributes)
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
        
        tableView.register(UINib(nibName: "BlogsCell", bundle: nil), forCellReuseIdentifier: "BlogsCell")
        
        
    
        searchBar.backgroundImage = UIImage()
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Blogs"
        
        navigationController?.navigationBar.tintColor = .darkGreen
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.darkGreen,
                                                                   NSAttributedString.Key.font: R.font.gorditaMedium(size: 20.0)]
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear
        
        
        
        let menuButtonImage = R.image.drawer()
        let menuButton = UIBarButtonItem(image: menuButtonImage, style: .plain, target: self, action: #selector(didTapMenuButton))
        navigationItem.leftBarButtonItem = menuButton
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.title = ""
    }
    
    @objc public func didTapMenuButton() {
        self.sideMenuViewController?.presentLeftMenuViewController()
    }
    
}

extension BlogsVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.blogsCell, for: indexPath) as? BlogsCell {
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
    
}

extension BlogsVC: UITableViewDelegate {
    
}
