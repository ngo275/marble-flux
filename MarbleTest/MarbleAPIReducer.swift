//
//  MarbleAPIReducer.swift
//  MarbleTest
//
//  Created by ShuichiNagao on 8/5/16.
//  Copyright © 2016 ShuichiNagao. All rights reserved.
//


import Foundation
import ReSwift
import Result

//struct MarbleAPIReducer: Reducer{
//    
//    typealias ReducerStateType = HasMarbleAPIState
//    
//    func handleAction(state: ReducerStateType, action: Action) -> ReducerStateType {
//        switch action {
//        case let action as SetArticleSearchResult:
//            return setArticleSearchResult(state, result: action.result)
//        default:
//            return state
//        }
//    }
//    
//    func setArticleSearchResult(var state:ReducerStateType,result:Result<[Article]>)->ReducerStateType {
//        state.marbleAPIState.sarchResults = result
//        return state
//    }
//    
//}