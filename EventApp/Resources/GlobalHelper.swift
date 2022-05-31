//
//  GlobalHelper.swift
//  EventApp
//
//  Created by Nitin Sakhare on 24/04/22.
//

import Foundation
import SVProgressHUD
import TTGSnackbar
import FittedSheets

public func showLoader() {
    SVProgressHUD.setForegroundColor(.darkGreen)
    SVProgressHUD.show()
}

public func hideLoader() {
    SVProgressHUD.dismiss()
}

public func showSnackBar(message: String, duration: TTGSnackbarDuration) {
    let snackbar = TTGSnackbar(message: message, duration: duration)
    snackbar.messageTextFont = R.font.gorditaRegular(size: 16)!
    snackbar.messageTextColor = hexColor(hex: "#FFFF67")
    snackbar.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    //    snackbar.backgroundColor = .darkGreen
    snackbar.show()
}

public func validateEmail(enteredEmail:String) -> Bool {
    let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
    return emailPredicate.evaluate(with: enteredEmail)
}

extension UIViewController{
    
    func openBottomSheet(sheetSize: [SheetSize], viewController: UIViewController){
        let botttomSheet = viewController
        let controller = SheetViewController(controller: botttomSheet, sizes: sheetSize)
        self.present(controller, animated: false, completion: nil)
    }
    
}
