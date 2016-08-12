//
//  ApiManager.swift
//  MarbleTest
//
//  Created by ShuichiNagao on 6/26/16.
//  Copyright © 2016 ShuichiNagao. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import BrightFutures

class APIManager: NSObject {
    
    static let sharedInstance = APIManager()
    var articles: [Article]?
    
    func get<T: ResponseSerializerType>(url: URLStringConvertible, params: [String: AnyObject], serializer: T) -> Future<T.SerializedObject, T.ErrorObject> {
        let promise = Promise<T.SerializedObject, T.ErrorObject>()
        
        Alamofire.request(.GET, url, parameters: params)
            .validate()
            .response(responseSerializer: serializer) { response in
                switch response.result {
                case .Success(let r):
                    promise.success(r)
                    
                case .Failure(let error):
                    print(error)
                    promise.failure(error)
                }
        }
        return promise.future
    }

    func fetchArticleList(params: [String: AnyObject]) -> Future<(Int,[Article]), NSError>  {
        let serializer = ArticleSerializer()
        let url = APIUrl.articleList
        return get(url, params: params, serializer: serializer)
    }
    
    private func mergeArticles(articles: [Article]) -> [Article] {
        if let _ = self.articles {
            let newArticles = self.articles! + articles
            return newArticles
        } else {
            return articles
        }
    }
    
}