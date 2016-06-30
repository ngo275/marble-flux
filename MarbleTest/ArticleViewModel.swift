//
//  ArticleViewModel.swift
//  MarbleTest
//
//  Created by ShuichiNagao on 6/26/16.
//  Copyright © 2016 ShuichiNagao. All rights reserved.
//

import UIKit
import BrightFutures
import SwiftyJSON
import Alamofire

class ArticleViewModel: NSObject {
    
//    var articles: [[String: String?]] = []
//    let table = UITableView()
//    var max: Int = 0
    private let apiManager = APIManager.sharedInstance
    
    func fetchArticleList(params: [String: AnyObject]) -> Future<(Int,[Article]), NSError>  {
        let serializer = ArticleSerializer()
        let url = APIUrl.articleList
        
        
        return apiManager.get(url, params: params, serializer: serializer)
    
        
        
    }
    
    
}
