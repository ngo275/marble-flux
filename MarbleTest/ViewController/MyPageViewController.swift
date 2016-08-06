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

//    private let store: Store<AppState> = Store<AppState>(reducer: CounterReducer(), state: AppState(counter: 0))

    var articles: [Article]?
    
    @IBOutlet weak var number: UILabel!
    
    @IBAction func increaseButtonOnClick(sender: UIButton) {
//        store.dispatch(CountActionIncrease())
    }
    
    @IBAction func decreaseButtonOnClick(sender: UIButton) {
//        store.dispatch(CountActionDecrease())
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        store.subscribe(self)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        store.subscribe(self)
        
        if store.state.article.fetchStatus == .Initial {
            fetchArticles()
        }
    }
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        store.unsubscribe(self)
    }
    
    func fetchArticles() {
        if store.state.article.fetchStatus != .Fetching {
            store.dispatch(ArticlesState.fetchArticles(nil))
        }
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


