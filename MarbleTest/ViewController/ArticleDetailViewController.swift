//
//  ArticleDetailViewController.swift
//  MarbleTest
//
//  Created by ShuichiNagao on 6/26/16.
//  Copyright © 2016 ShuichiNagao. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire
import WebImage
import ReSwift

class ArticleDetailViewController: UIViewController {

    let apiManager: APIManager = APIManager.sharedInstance
    var article: Article?
    
    @IBOutlet weak var articleBody: UITextView!
    
    @IBAction func like(sender: UIButton) {
        let like = !LikesUtils.isLike(Int32(article!.id))
        if like {
            // when the article's not liked yet.
            store.dispatch(ArticlesState.LikeArticle(article: article))
            print("Like: \(article!.id)")
        } else {
            // when the article's liked already.
            store.dispatch(ArticlesState.UnLikeArticle(article: article))
            print("Unlike: \(article!.id)")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        if let article = article {
            articleBody.text = article.body
            articleBody.editable = false
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
