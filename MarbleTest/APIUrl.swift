//
//  APIUrl.swift
//  MarbleTest
//
//  Created by ShuichiNagao on 6/26/16.
//  Copyright © 2016 ShuichiNagao. All rights reserved.
//

import UIKit

class APIUrl {
    private static let host = "http://api.topicks.jp"
    
    static var articleList: String {
        return host + "/api/v1/articles/list.json"
    }
    
    static var articleDetail: String {
        return host + "/api/v1/articles/show.json"
    }
    
    static var tagList: String {
        return host + "/api/v1/tags/topics.json"
    }
    
    static var tagSearch: String {
        return host + "/api/v1/tags/list.json"
    }
    
    static var noticesList: String {
        return host + "/api/v1/notices/notice.json"
    }
}
