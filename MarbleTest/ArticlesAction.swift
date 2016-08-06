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
    
extension ArticlesState {
    static func fetchArticles(maxId: String?) -> Store<AppState>.AsyncActionCreator  {
        return { (state, store, callback) in
            store.dispatch(RequestGetArticles())
//            let client = TWTRAPIClient.clientWithCurrentUser()
//            let statusesShowEndpoint = "https://api.twitter.com/1.1/statuses/home_timeline.json"
            var clientError : NSError?
            
//            var params: [String: AnyObject] = [ : ]
//            if let maxId = maxId {
//                params["max_id"] = maxId
//            }
            let params = ["search_type": "category"]
            let serializer = ArticleSerializer()
            let url = APIUrl.articleList
            Alamofire.request(.GET, url, parameters: params)
                .validate()
//                .response (responseSerializer: serializer) { response in
//                    print(response.result.value)
//                    if let connectionError = response.result.error {
//                        callback { _,_ in ErrorGetArticles(error: connectionError)}
//                    } else {
//                        let articles = ArticleSerializer(serializeResponse: response.result.value)
//                        callback { _,_ in ResponseGetArticles(articles: articles) }
//                    }
//                }
                .responseJSON { response in
                    if let connectionError = response.result.error {
                        callback { _,_ in ErrorGetArticles(error: connectionError)}
                    } else {
//                        let jsons = JSON(response.result.value!)
                        do {
                            if let jsons: JSON = JSON(response.result.value!) {
                                let dict = response.result.value as! NSDictionary
//                                print(dict["results"]![20])
                                let dict2 = dict["results"] as! NSArray
                                var articles: [Article]?
                                articles = dict2.map { data in Article(json: JSON(data)) }
//                                dict2.forEach { (i, json) in
//                                    articles?.append(Article(json: json))
////                                    print(jsons[i])
//                                }
//                                print(articles)
                                if let articles0 = articles {
                                    callback { _,_ in ResponseGetArticles(articles: articles0) }
                                }
                            }
                        } catch let jsonError as NSError {
                            print("failed!!!")
                            callback { _,_ in ErrorGetArticles(error: jsonError)}
                        }
//                        let articles = jsons.map { Article(json: $0) }
//                        let articles = Article(json: jsons)
                    }
                }
        }
    }
}

