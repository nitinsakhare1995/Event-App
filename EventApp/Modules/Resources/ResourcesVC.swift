//
//  ResourcesVC.swift
//  EventApp
//
//  Created by Nitin Sakhare on 23/04/22.
//

import UIKit
import AKSideMenu
import PDFKit

class ResourcesVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var data = [ResourcesContentModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "ResourcesCell", bundle: nil), forCellReuseIdentifier: "ResourcesCell")
        
        getResourcesList()
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
    
    func getResourcesList() {
        Remote.shared.getResources { userData in
            self.data = userData.content ?? []
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
}

extension ResourcesVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.resourcesCell, for: indexPath) as? ResourcesCell {
            cell.selectionStyle = .none
            cell.lblName.text = self.data[indexPath.row].resource_title
            cell.saveResource = {
                let userDefaults = UserDefaults.standard
                if let userId = userDefaults.string(forKey: "UDUserId") {
                    Remote.shared.saveResource(userId: userId) { userData in
                        if userData.requestStatus == "Success" {
                            showSnackBar(message: "Resource saved", duration: .middle)
                        } else {
                            showSnackBar(message: "Something went wrong", duration: .middle)
                        }
                    }
                }
               
            }
            return cell
        }
        return UITableViewCell()
    }
    
}

extension ResourcesVC: UITableViewDelegate {
 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let baseURL = Constants.baseImgURL
        let pdfURL = self.data[indexPath.row].resource_pdf ?? ""
        let finalURL = "\(baseURL)\(pdfURL)"
        storeAndShare(withURLString: finalURL)
    }
    
}

extension ResourcesVC: UIDocumentInteractionControllerDelegate {
    /// If presenting atop a navigation stack, provide the navigation controller in order to animate in a manner consistent with the rest of the platform
    func documentInteractionControllerViewControllerForPreview(_ controller: UIDocumentInteractionController) -> UIViewController {
        guard let navVC = self.navigationController else {
            return self
        }
        return navVC
    }
}

extension ResourcesVC {
    /// This function will set all the required properties, and then provide a preview for the document
    func share(url: URL) {
        let documentInteractionController = UIDocumentInteractionController()
        documentInteractionController.delegate = self
        documentInteractionController.url = url
        documentInteractionController.uti = url.typeIdentifier ?? "public.data, public.content"
        documentInteractionController.name = url.localizedName ?? url.lastPathComponent
        documentInteractionController.presentPreview(animated: true)
    }
    
    /// This function will store your document to some temporary URL and then provide sharing, copying, printing, saving options to the user
    func storeAndShare(withURLString: String) {
        guard let url = URL(string: withURLString) else { return }
        showLoader()
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                hideLoader()
                return }
            let tmpURL = FileManager.default.temporaryDirectory
                .appendingPathComponent(response?.suggestedFilename ?? "fileName.png")
            do {
                try data.write(to: tmpURL)
            } catch {
                print(error)
            }
            DispatchQueue.main.async {
                hideLoader()
                self.share(url: tmpURL)
            }
            }.resume()
    }
}

extension URL {
    var typeIdentifier: String? {
        return (try? resourceValues(forKeys: [.typeIdentifierKey]))?.typeIdentifier
    }
    var localizedName: String? {
        return (try? resourceValues(forKeys: [.localizedNameKey]))?.localizedName
    }
}
