//
//  HAUtility.swift
//
//  Created by Thangarajan on 08/07/18.
//  Copyright © 2018 Thangarajan. All rights reserved.
//

import UIKit

class HAUtility: NSObject {
    
    static let sharedUtility = HAUtility()
    
    var container: UIView = UIView()
    var loadingView: UIView = UIView()
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    let urAlertInstance = HAAlert()
    
 //   var profile : URProfileDataSourceItem?
    
    func  showActivityIndicator() {
        
        let viewController = (UIApplication.shared.keyWindow?.rootViewController)! as UIViewController
        let uiView = viewController.view
        container.frame = (uiView?.frame)!
        container.center = (uiView?.center)!
        loadingView.frame = (uiView?.frame)!
        loadingView.backgroundColor = .black
        loadingView.center = (uiView?.center)!
        loadingView.alpha = 0.3
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.whiteLarge
        activityIndicator.center = CGPoint(x: loadingView.frame.size.width / 2, y: loadingView.frame.size.height / 2)
        container.addSubview(loadingView)
        
        let win : UIWindow = ((UIApplication.shared.delegate?.window)!)!
        win.addSubview(container)
        win.addSubview(activityIndicator)
        activityIndicator.startAnimating()
    }
    
    func hideActivityIndicator() {
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            self.container.removeFromSuperview()
        }
    }
    
}
