//
//  ArticleViewController.swift
//  MarbleTest
//
//  Created by ShuichiNagao on 6/26/16.
//  Copyright © 2016 ShuichiNagao. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire
import PullAndInfiniteTableView
import ReSwift

class ArticleViewController: UIViewController {
    
//    private let viewmodel = ArticleViewModel()
    private let apiManager: APIManager = APIManager.sharedInstance
    private var articles: [Article]? {
        get {
            return apiManager.articles
        }
        set(newValue) {
            apiManager.articles = newValue
        }
    }
    
//    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableView: PullAndInfiniteTableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "MARBLE"
        
        load()
        store.subscribe(self)
        initTableView()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    private func showErrorAlert(message: String, completion: ((UIAlertAction) -> Void)?) {
        let alert = UIAlertController(title: "MARBLE",
                                      message: message,
                                      preferredStyle: UIAlertControllerStyle.Alert
        )
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: completion))
        presentViewController(alert, animated: true, completion: nil)
    }
    
    // initial loading when this app is opend
    private func load() {
        let params: [String: AnyObject] = [
            "search_type": "category",
            "limit": 10,
            //            "category_id": categoryId
        ]
        apiManager.fetchArticleList(params)
            .onSuccess { [weak self] data in
                self?.articles = data.1
                store.dispatch(ArticlesState.ResponseGetArticles(articles: data.1))
            }
            .onFailure { [weak self] error in
                self?.showErrorAlert(error.localizedDescription, completion: nil)
        }
    }
    
    private func initTableView() {
        tableView.registerNib(UINib(nibName: "ArticleCell", bundle: nil), forCellReuseIdentifier: "ArticleCell")
        // dataSource and delegate are connected to this class in the storyboard.
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 105.0
//        tableView.showPullToRefresh = true
//        tableView.addInfiniteScrollHandler { [weak self] in
//            self?.load()
//        }

    }
}

extension ArticleViewController: UITableViewDelegate, UITableViewDataSource {
    
    // return the number of tableCells
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles?.count ?? 0
    }
    // draw the tableCells
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: ArticleCell = tableView.dequeueReusableCellWithIdentifier("ArticleCell") as! ArticleCell
        cell.setCell(articles![indexPath.row])
        return cell
    }
    // action when a cell is tapped
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let storyboard: UIStoryboard = UIStoryboard(name: "ArticleDetail", bundle: nil)
        if let next: ArticleDetailViewController = storyboard.instantiateViewControllerWithIdentifier("ArticleDetail") as? ArticleDetailViewController {
            next.article = articles![indexPath.row]
            navigationController?.pushViewController(next, animated: true)
        }
    }
}

extension ArticleViewController: StoreSubscriber {
    func newState(state: AppState) {
        if state.article.fetchStatus != .Fetching {
            //            refreshControl?.endRefreshing()
        }
        self.articles = state.article.articles
        tableView.reloadData()
    }
}


