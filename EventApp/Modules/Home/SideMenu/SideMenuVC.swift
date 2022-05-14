//
//  SideMenuVC.swift
//  EventApp
//
//  Created by Nitin Sakhare on 23/04/22.
//

import UIKit
import AKSideMenu

class SideMenuVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.fromGradientWithDirection(.topToBottom, frame: self.view.frame, colors:  [.lightGreen, .darkGreen])
        
    }
    
    @IBAction func closeDrawerMenu(_ sender: UIButton) {
        self.sideMenuViewController?.hideMenuViewController()
    }
    
    @IBAction func openResources(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Other", bundle: nil).instantiateViewController(withIdentifier: "ResourcesVC") as! ResourcesVC
        let contentViewController = UINavigationController(rootViewController: vc)
        sideMenuViewController?.setContentViewController(contentViewController, animated: true)
        sideMenuViewController?.hideMenuViewController()
    }
    
    @IBAction func openHome(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
        let contentViewController = UINavigationController(rootViewController: vc)
        sideMenuViewController?.setContentViewController(contentViewController, animated: true)
        sideMenuViewController?.hideMenuViewController()
    }
    
    @IBAction func openUserProfile(_ sender: UIButton) {
        let vc = UIStoryboard(name: "User", bundle: nil).instantiateViewController(withIdentifier: "UserProfileVC") as! UserProfileVC
        let contentViewController = UINavigationController(rootViewController: vc)
        sideMenuViewController?.setContentViewController(contentViewController, animated: true)
        sideMenuViewController?.hideMenuViewController()
    }
    
    @IBAction func btnLogoutTapped(_ sender: UIButton) {
        clearUserDefaults()
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginOptionsVC") as! LoginOptionsVC
        let nav = UINavigationController(rootViewController: vc)
        switchRootViewController(rootViewController: nav, animated: true, completion: nil)
    }
    
    func switchRootViewController(rootViewController: UIViewController, animated: Bool, completion: (() -> Void)?) {
        guard let window = UIApplication.shared.keyWindow else { return }
        if animated {
            UIView.transition(with: window, duration: 0.5, options: .transitionCrossDissolve, animations: {
                let oldState: Bool = UIView.areAnimationsEnabled
                UIView.setAnimationsEnabled(false)
                window.rootViewController = rootViewController
                UIView.setAnimationsEnabled(oldState)
            }, completion: { (finished: Bool) -> () in
                if (completion != nil) {
                    completion!()
                }
            })
        } else {
            window.rootViewController = rootViewController
        }
    }
    
    func clearUserDefaults() {
        let userDefault = UserDefaults.standard
        userDefault.removeObject(forKey: "isLoggedIn")
        let domain = Bundle.main.bundleIdentifier!
        userDefault.removePersistentDomain(forName: domain)
        userDefault.synchronize()
    }
    
    
}
