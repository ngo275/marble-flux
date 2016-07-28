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

class ArticleDetailViewController: UIViewController {

    let apiManager: APIManager = APIManager.sharedInstance
    var article: Article?
    
    @IBOutlet weak var articleBody: UITextView!
    
    @IBAction func like(sender: UIButton) {
        let like = !LikesUtils.isLike(Int32(article!.id))
        if like {
            // when the article's not liked yet.
            LikesUtils.like(Int32(article!.id), data: article!.toJson())
            print("Like: \(article!.id)")
        } else {
            // when the article's liked already.
            LikesUtils.unlike(Int32(article!.id))
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
