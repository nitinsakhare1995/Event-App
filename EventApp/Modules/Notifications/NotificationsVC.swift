//
//  NotificationsVC.swift
//  EventApp
//
//  Created by Nitin Sakhare on 23/04/22.
//

import UIKit

class NotificationsVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "NotificationsCell", bundle: nil), forCellReuseIdentifier: "NotificationsCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Notifications"
        
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

extension NotificationsVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.notificationsCell, for: indexPath) as? NotificationsCell {
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
    
}

extension NotificationsVC: UITableViewDelegate {
   
}
