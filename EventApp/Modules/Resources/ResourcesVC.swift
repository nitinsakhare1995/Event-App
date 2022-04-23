//
//  ResourcesVC.swift
//  EventApp
//
//  Created by Nitin Sakhare on 23/04/22.
//

import UIKit
import AKSideMenu

class ResourcesVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "ResourcesCell", bundle: nil), forCellReuseIdentifier: "ResourcesCell")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Resources"
        
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

extension ResourcesVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.resourcesCell, for: indexPath) as? ResourcesCell {
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
    
}

extension ResourcesVC: UITableViewDelegate {
    
}
