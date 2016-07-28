//
//  LikesUtils.swift
//  MarbleTest
//
//  Created by ShuichiNagao on 7/27/16.
//  Copyright © 2016 ShuichiNagao. All rights reserved.
//

import UIKit
import RealmSwift
import SwiftyJSON

class LikesUtils {
    static func isLike(id: Int32) -> Bool {
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let path = paths[0] + "/like.realm"
        let url = NSURL(fileURLWithPath: path)
        let realm = try! Realm(fileURL: url)
        
        let newId = Int(id)
        let like = realm.objectForPrimaryKey(Likes.self, key: newId)
        return (like != nil)
    }
    
    static func like(id: Int32, data: JSON) {
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let path = paths[0] + "/like.realm"
        let url = NSURL(fileURLWithPath: path)
        let realm = try! Realm(fileURL: url)
        
        let like = Likes()
        
        like.id = id
        like.category_id = data["Article"]["category_id"].int16Value
        like.category_name = data["Article"]["category_name"].stringValue
        like.title = data["Article"]["title"].stringValue
        like.body = data["Article"]["body"].stringValue
        like.thumb_normal = data["Article"]["thumb_normal"].stringValue
        like.thumb_original = data["Article"]["thumb_original"].stringValue
        like.provider = data["Article"]["provider"].stringValue
        
        like.modified = data["Article"]["modified"].int64Value
        like.published = data["Article"]["published"].int64Value
        
        like.user_id = data["User"]["id"].int32Value
        like.username = data["User"]["username"].stringValue
        like.screenname = data["User"]["screenname"].stringValue
        
        like.date = NSDate()
        print(like)
        try! realm.write() {
            realm.add(like, update: true)
        }
    }
    
    static func unlike(id: Int32) {
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let path = paths[0] + "/like.realm"
        let url = NSURL(fileURLWithPath: path)
        let realm = try! Realm(fileURL: url)
        
        let newId = Int(id)
        let like = realm.objectForPrimaryKey(Likes.self, key: newId)
        
        try! realm.write() {
            realm.delete(like!)
        }
    }
    
    static func list(offset: Int, limit: Int) -> [JSON] {
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let path = paths[0] + "/like.realm"
        let url = NSURL(fileURLWithPath: path)
        let realm = try! Realm(fileURL: url)
        var array: [JSON] = []
        
        let likes = realm.objects(Likes).sorted("date", ascending: false)

        let max = (offset + limit) < likes.count ? (offset + limit) : likes.count
        
        for i in offset..<max {
            let like = likes[i]
            let article = [
                "id": String(like.id),
                "category_id": String(like.category_id),
                "category_name": like.category_name,
                "title": like.title,
                "body": like.body,
                "thumb_normal": like.thumb_normal,
                "thumb_original": like.thumb_original,
                "provider": like.provider,
                "modified": NSNumber(longLong: like.modified),
                "published":  NSNumber(longLong: like.published),
                "date": String(like.date)
            ]
            
            let user = [
                "id": String(like.user_id),
                "username": like.username,
                "screenname": like.screenname
            ]
            
            let json: JSON = ["Article": article, "User": user]
            array.append(json)
        }
        return array
    }
    
    
    
}
