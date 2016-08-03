//
//  NavigationController.swift
//  Marble
//
//  Created by Tomoo Kaku on 2016/03/06.
//  Copyright © 2016年 Tomoo Kaku. All rights reserved.
//
//　全てのナビゲーションコントローラーの共通部分

import UIKit

class NavigationController: UINavigationController {
    
    var statusBarStyle: UIStatusBarStyle = UIStatusBarStyle.Default
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //        self.navigationBar.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /*
     func hideNaviShadowWithView(view: UIView) -> Bool {
     if (view is UIImageView) && view.frame.size.height <= 1 {
     view.hidden = true
     return true
     }
     for sub: UIView in view.subviews {
     if self.hideNaviShadowWithView(sub) {
     return true
     }
     }
     return false
     }
     */
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        //        print("preferredStatusBarStyle: \(statusBarStyle)")
        return statusBarStyle
    }
}

