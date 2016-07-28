//
//  Likes.swift
//  MarbleTest
//
//  Created by ShuichiNagao on 7/27/16.
//  Copyright © 2016 ShuichiNagao. All rights reserved.
//

import UIKit
import SwiftyJSON
import RealmSwift

class Likes: Object {
    
    dynamic var id: Int32 = 0
    dynamic var category_id: Int16 = 0
    dynamic var category_name: String = ""
    dynamic var title: String = ""
    dynamic var body: String = ""
    dynamic var provider: String = ""
    dynamic var thumb_normal: String = ""
    dynamic var thumb_original: String = ""
    dynamic var published: Int64 = 0
    dynamic var modified: Int64 = 0
    
    dynamic var user_id: Int32 = 0
    dynamic var username: String = ""
    dynamic var screenname: String = ""
    
    dynamic var date = NSDate()
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    override static func indexedProperties() -> [String] {
        return ["date"]
    }

}
