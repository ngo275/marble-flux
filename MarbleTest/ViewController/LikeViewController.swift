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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(animated: Bool) {
        let articles = LikesUtils.list(0, limit: 20).map {Article(json: $0)}
        print(articles)
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
