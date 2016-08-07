//
//  MyPageViewController.swift
//  MarbleTest
//
//  Created by ShuichiNagao on 7/21/16.
//  Copyright © 2016 ShuichiNagao. All rights reserved.
//

import UIKit
import ReSwift

class MyPageViewController: UIViewController {

    var articles: [Article]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        store.unsubscribe(self)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension MyPageViewController: StoreSubscriber {
    func newState(state: AppState) {
        //        number.text = String(state.counter)
        if state.article.fetchStatus != .Fetching {
//            refreshControl?.endRefreshing()
        }
        
        self.articles = state.article.articles
        // In production, you should calucurate entries' diff and udpate each cells.
//        tableView.reloadData()
        print(self.articles)
    }

}


