//
//  StateCreator.swift
//  MarbleTest
//
//  Created by ShuichiNagao on 8/5/16.
//  Copyright © 2016 ShuichiNagao. All rights reserved.
//

import ReSwift

let loggingMiddleware: Middleware = { dispatch, getState in
    return { dispatch in
        return { action in
            debugPrint("\(action)")
            return dispatch(action)
        }
    }
}

let reducers = CombinedReducer([
//    AuthSessionState.Reducer(),
    ArticlesState.Reducer(),
])


let store = Store<AppState>(reducer: reducers, state: nil, middleware: [loggingMiddleware])
