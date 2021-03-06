//
//  SpeakersVC.swift
//  EventApp
//
//  Created by Nitin Sakhare on 23/04/22.
//

import UIKit

enum SpeakerListType {
    case session
    case normal
}

class SpeakersVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var data = [SpeakerContentModel]()
    var agendaId: String?
    var useType: SpeakerListType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "SpeakersCell", bundle: nil), forCellReuseIdentifier: "SpeakersCell")
        
        if useType == .normal {
        showSpeakersList()
        } else {
            showSessionsSpeakersList()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Speakers"
        
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
    
    func showSpeakersList() {
        Remote.shared.getSpeakersList { userData in
            self.data = userData.content ?? []
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func showSessionsSpeakersList() {
        if let agendaId = self.agendaId {
            Remote.shared.getSessionsSpeakersList(agendaId: agendaId) { userData in
                self.data = userData.content ?? []
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
}

extension SpeakersVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 95
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.speakersCell, for: indexPath) as? SpeakersCell {
            cell.selectionStyle = .none
            cell.configureCell(data: self.data[indexPath.row])
            if useType == .normal {
                cell.imgArrow.isHidden = false
            } else {
                cell.imgArrow.isHidden = true
            }
            return cell
        }
        return UITableViewCell()
    }
    
}

extension SpeakersVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if useType == .normal {
            let vc = UIStoryboard(name: "Speakers", bundle: nil).instantiateViewController(withIdentifier: "SpeakerDetailsVC") as! SpeakerDetailsVC
            vc.speakerId = self.data[indexPath.row].speaker_id
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
