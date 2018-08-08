//
//  ViewController.swift
//  NYTimesMostPopularArticles
//
//  Created by Thangarajan K on 08/08/18.
//  Copyright © 2018 Thangarajan K. All rights reserved.
//

import UIKit
import SVProgressHUD

class ViewController: UIViewController {

    var articleBase: ArticleBase!
    @IBOutlet weak var listTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        listTableView.accessibilityIdentifier = "tableView"
        self.title = "NY Times Most Popular"
        self.getArticleData()
    }
    
    func getArticleData() {
        self.showProgress()
        LRServiceManager.shared.getNyArticles { (response, error) in
            self.hideProgress()
            if error == nil {
                self.articleBase = ArticleBase.parse(response)
                DispatchQueue.main.async {
                    self.listTableView.reloadData()
                }
            }
        }
    }
    
    func showProgress(){
        SVProgressHUD.setDefaultStyle(.light)
        SVProgressHUD.setDefaultMaskType(.black)
        SVProgressHUD.show()
    }
    
    func hideProgress(){
        DispatchQueue.main.async {
            SVProgressHUD.dismiss()
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    //MARK: Delegates
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleBase?.results?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat{
        return 0.001
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 145.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "articleCell") as! NYArcticleListTableViewCell
        cell.selectionStyle = .none
        cell.updateCell(self.articleBase?.results![indexPath.row])
        return cell
    }
}
