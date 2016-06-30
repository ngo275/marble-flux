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

class ArticleViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private let viewmodel = ArticleViewModel()
    private let apiManager: APIManager = APIManager.sharedInstance
    private var articles: [Article]?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "MARBLE"
        
        let params: [String: AnyObject] = [
            "search_type": "category",
            "limit": 30,
//            "category_id": categoryId
        ]
        viewmodel.fetchArticleList(params)
            .onSuccess { [weak self] data in
                self?.articles = data.1
                self?.tableView.reloadData()
            }
            .onFailure { [weak self] error in
                self?.showErrorAlert(error.localizedDescription, completion: nil)
        }
        
        tableView.registerNib(UINib(nibName: "ArticleCell", bundle: nil), forCellReuseIdentifier: "ArticleCell")
//        tableView.dataSource = self
//        tableView.delegate = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 105.0
//        self.view.addSubview(tableView)
        
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
    
    
    // tableCellの数を返すだけのためのメソッド
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles?.count ?? 0
    }
    
    // cellの描画をするためのメソッド
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: ArticleCell = tableView.dequeueReusableCellWithIdentifier("ArticleCell") as! ArticleCell
        cell.setCell(articles![indexPath.row])
        return cell
    }
    
    // cellを選択された時のアクション
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let storyboard: UIStoryboard = UIStoryboard(name: "ArticleDetail", bundle: nil)
        if let next: ArticleDetailViewController = storyboard.instantiateViewControllerWithIdentifier("ArticleDetail") as? ArticleDetailViewController {
            next.article = articles![indexPath.row]
            navigationController?.pushViewController(next, animated: true)
        }
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
