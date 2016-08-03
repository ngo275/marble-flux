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

    
    
    
}