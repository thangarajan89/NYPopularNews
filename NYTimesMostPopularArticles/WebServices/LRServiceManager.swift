//
//  LRServiceManager.swift
//
//  Created by Thangarajan on 08/07/18.
//  Copyright © 2018 Thangarajan. All rights reserved.
//

import UIKit

typealias responseCompletion = (_ response: Any?, _ error: Error?) -> Void

let APIKEY = "3cedec87a47a4ee1addb3158968b597e"
let BaseURL = "http://api.nytimes.com/svc/"
let getPopularArticlesURL = "mostpopular/v2/mostviewed/all-sections/7.json?api-key="

class LRServiceManager: NSObject {
    
    static var shared = LRServiceManager()
    let userDefault = UserDefaults.standard
    
    func getNyArticles(completion:@escaping responseCompletion) {
        HAConnection.getWithoutQuery(getPopularArticlesURL + APIKEY) { (response, error) in
            completion(response, error)
        }
    }
}
