//
//  SessionsVC.swift
//  EventApp
//
//  Created by Nitin Sakhare on 08/05/22.
//

import UIKit

class SessionsVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var data = [SessionsContentModel]()
    var agendaId: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "SessionsCell", bundle: nil), forCellReuseIdentifier: "SessionsCell")
        
        getSessionsList()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Sessions"
        
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
    
    func getSessionsList() {
        if let agendaId = self.agendaId {
            Remote.shared.getSessions(agendaId: agendaId) { userData in
                self.data = userData.content ?? []
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
}

extension SessionsVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "SessionsCell", for: indexPath) as? SessionsCell {
            cell.selectionStyle = .none
            cell.configureCell(data: self.data[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
}

extension SessionsVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "User", bundle: nil).instantiateViewController(withIdentifier: "SessionReminderBottomSheet") as! SessionReminderBottomSheet
        vc.sessionid = self.data[indexPath.row].session_id
        vc.speakerId = self.data[indexPath.row].session_speakerid
        vc.speakerName = self.data[indexPath.row].speaker_name
        vc.speakerDesignataion = self.data[indexPath.row].speaker_designation
        vc.panellistData = self.data[indexPath.row].panellistData ?? []
        vc.profilePicUrl = self.data[indexPath.row].profile_pic
        vc.sessiontitle = self.data[indexPath.row].session_title
        var height = 270
        if let count = self.data[indexPath.row].panellistData?.count {
            let addheight = count * 40
            height += addheight
        }
        vc.height = CGFloat(height)
        print("HEIGHT \(height)")
        self.openBottomSheet(sheetSize: [.fixed(CGFloat(height))], viewController: vc)
    }
    
}
