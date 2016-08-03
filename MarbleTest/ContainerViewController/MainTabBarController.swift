//
//  MainTabBarController.swift
//  MarbleTest
//
//  Created by ShuichiNagao on 7/21/16.
//  Copyright © 2016 ShuichiNagao. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.tabBar.translucent = true
    }
    
    override func viewDidLoad() {
        let articleStoryboard = UIStoryboard(name: "Article", bundle: nil)
        let searchStoryboard = UIStoryboard(name: "Search", bundle: nil)
        let likeStoryboard = UIStoryboard(name: "Like", bundle: nil)
        let myPageStoryboard = UIStoryboard(name: "MyPage", bundle: nil)
        let articleViewController = articleStoryboard.instantiateInitialViewController() as! ArticleContainerController
        let searchViewController = searchStoryboard.instantiateInitialViewController() as! SearchContainerController
        let likeViewController = likeStoryboard.instantiateInitialViewController() as! LikeContainerController
        let myPageViewController = myPageStoryboard.instantiateInitialViewController() as! MyPageContainerController
        let viewControllers = [articleViewController, searchViewController, likeViewController, myPageViewController]
        self.setViewControllers(viewControllers, animated: false)
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
