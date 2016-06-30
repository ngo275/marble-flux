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

class ArticleDetailViewController: UIViewController {

    let apiManager: APIManager = APIManager.sharedInstance
    var article: Article?
    
    @IBOutlet weak var articleBody: UITextView!
    
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
