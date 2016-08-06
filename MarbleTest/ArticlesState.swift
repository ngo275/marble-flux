//  MarbleTest
//
//  Created by ShuichiNagao on 8/5/16.
//  Copyright © 2016 ShuichiNagao. All rights reserved.
//

import Foundation
import Result

struct ArticlesState {
//    var searchResult: Result<[Article]>?
    var fetchStatus: FetchStatus = .Initial
    var articles: [Article]?
    var error: NSError?
    var maxId: String?
}

//protocol HasArticleAPIState {
//    var marbleAPIState: MarbleAPIState { get set }
//}