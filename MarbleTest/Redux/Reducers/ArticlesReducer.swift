//
//  TimelineReducer.swift
//  MarbleTest
//
//  Created by ShuichiNagao on 8/5/16.
//  Copyright © 2016 ShuichiNagao. All rights reserved.
//

import ReSwift
import RealmSwift

extension ArticlesState {
    struct Reducer: ReSwift.Reducer {
        typealias ReducerStateType = AppState
        func handleAction(action: Action, state: ReducerStateType?) -> ReducerStateType {
            let prevState = state ?? AppState()
            var nextState = prevState
            var nextArticleState = nextState.article
            
            switch action {
            case is RequestGetArticles:
                nextArticleState.fetchStatus = .Fetching

            case let action as ResponseGetArticles:
                nextArticleState.fetchStatus = .Success
                nextArticleState.articles = action.articles
                nextArticleState.maxId = String(nextArticleState.articles?.last?.id)
                
            case let action as ErrorGetArticles:
                nextArticleState.fetchStatus = .Error
                nextArticleState.error = action.error
            
            case let action as LikeArticle:
                LikesUtils.like(Int32(action.article!.id), data: action.article!.toJson())
            
            case let action as UnLikeArticle:
                LikesUtils.unlike(Int32(action.article!.id))
                
            case is ResponseGetLikedArticles:
                nextArticleState.likedArticles = LikesUtils.list(0, limit: 20).map {Article(json: $0)}
                                
            default:
                break
            }
            
            nextState.article = nextArticleState
            return nextState
        }
    }
}