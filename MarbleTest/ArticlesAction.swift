//
//  SetArticleSearchResult.swift
//  MarbleTest
//
//  Created by ShuichiNagao on 8/5/16.
//  Copyright © 2016 ShuichiNagao. All rights reserved.
//

import Foundation
import Result
import ReSwift
import Alamofire
import BrightFutures
import SwiftyJSON

extension ArticlesState {
    struct RequestGetArticles: Action {}
    struct ResponseGetArticles: Action {
        let articles: [Article]
    }
    struct ErrorGetArticles: Action {
        let error: NSError
    }
}



