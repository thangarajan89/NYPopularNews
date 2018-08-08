//
//  HAAlert.swift
//
//  Created by Thangarajan on 08/07/18.
//  Copyright © 2018 Thangarajan. All rights reserved.
//

import UIKit

class HAAlert: NSObject {
    
    @discardableResult func showInternetAccessAlert() -> UIAlertController
    {
        let alertTitle = "Cannot Access Web Methods"
        let alertMessage = "Unfortunately we cannot access the internet methods necessary to complete your selected function. Please verify your internet connection."
        let alertController: UIAlertController = HAAlert.alertController(title: alertTitle, message: alertMessage, actions: [HAAlert.acceptAction()])
        HAAlert.showAlertController(alertController: alertController)
        return alertController
    }
    
    class func showAlertController(alertController: UIAlertController)
    {
        let appDelegate  = UIApplication.shared.delegate
        let viewController = appDelegate!.window!?.rootViewController
        
        DispatchQueue.main.async {
            alertController.view.layoutIfNeeded()
            viewController?.present(alertController, animated: true, completion: nil)
        }
    }
    
    class func alertController(title: String, message: String, actions:[UIAlertAction]) -> UIAlertController
    {
        let alertController: UIAlertController = UIAlertController(title: title , message: message , preferredStyle: UIAlertControllerStyle.alert)
        
        for action in actions {
            alertController.addAction(action)
        }
        
        return alertController
    }
    
    class func showAlert(message : String, okAction:@escaping () -> Void){
        let alert = UIAlertController(title: "Message", message: message, preferredStyle: .alert)
        let okAction: UIAlertAction = UIAlertAction(title: "Ok", style: .cancel) { action -> Void in
            //Just dismiss the action sheet
            okAction()
        }
        alert.addAction(okAction)
        HAAlert.showAlertController(alertController: alert)
    }
    
    
    class func acceptAction() -> UIAlertAction
    {
        let acceptAction: UIAlertAction = UIAlertAction(title: "Ok", style: .default) { (action) in
            
        }
        return acceptAction
    }
    
}
