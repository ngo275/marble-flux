//
//  Utils.swift
//  MarbleTest
//
//  Created by ShuichiNagao on 6/27/16.
//  Copyright © 2016 ShuichiNagao. All rights reserved.
//


import UIKit

class Utils {
    
    static func createErrorObject(message: String, code: Int = 100) -> NSError {
        let domain = "jp.co.candle.app.marble"
        
        return NSError(domain: domain, code: 100, userInfo: [NSLocalizedDescriptionKey: message])
    }
    
    static func createViewController<T: UIViewController>(viewControllerIdentifier identifier: String,viewControllerType type: T) -> T? {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewControllerWithIdentifier(identifier) as? T
    }
    
}

