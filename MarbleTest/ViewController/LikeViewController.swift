//
//  LikeViewController.swift
//  MarbleTest
//
//  Created by ShuichiNagao on 7/21/16.
//  Copyright © 2016 ShuichiNagao. All rights reserved.
//

import UIKit
import SwiftyJSON
import RealmSwift

class LikeViewController: UIViewController {
    
    let apiManager: APIManager = APIManager.sharedInstance
    var articles: [Article]?
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(animated: Bool) {
        self.articles = LikesUtils.list(0, limit: 20).map {Article(json: $0)}
        initTableView()
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


extension LikeViewController: UITableViewDelegate, UITableViewDataSource {
    // MARK: UITableViewDelegate
    
    func scrollViewShouldScrollToTop(scrollView: UIScrollView) -> Bool {
        return true
    }
    
    // MARK: - UITableViewDataSource
    
    // return the number of sections
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    // return the number of tableCells
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles?.count ?? 0
    }
    // return the height of each cell
    //    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    //        return 84
    //    }
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



