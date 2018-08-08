//
//  HAConnection.swift
//
//  Created by Thangarajan on 08/07/18.
//  Copyright © 2018 Thangarajan. All rights reserved.
//

import UIKit

class HAConnection: NSObject {

    @discardableResult class func getWithoutQuery(_ path: String, completion:@escaping responseCompletion) -> URLSessionDataTask {
        let request = NSMutableURLRequest(url: URL(string: BaseURL + path)!)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        return HAConnection.sendRequest(request, completion: completion)
    }
    
    //MARK: Request Handler

    @discardableResult class func sendRequest(_ request: NSMutableURLRequest, completion: @escaping responseCompletion) -> URLSessionDataTask {
        request.timeoutInterval = 60.0

        if !(HAReachability.isNetworkConnected()) {
            DispatchQueue.main.async {
                HAUtility.sharedUtility.hideActivityIndicator()
                HAUtility.sharedUtility.urAlertInstance.showInternetAccessAlert()
            }
        }
        
        let session: URLSession = URLSession.shared
        
        let task: URLSessionDataTask = session.dataTask(with: request as URLRequest){ (response, urlResponse, error) in
            
            let returnData = String(data: response!, encoding: .utf8)
            print(returnData ?? "")
            completion(response, error)
        }
        task.resume()
        return task
    }
}
