//
//  TimelineReducer.swift
//  MarbleTest
//
//  Created by ShuichiNagao on 8/5/16.
//  Copyright © 2016 ShuichiNagao. All rights reserved.
//

import ReSwift

//struct CounterReducer: Reducer {
//    
//    typealias ReducerStateType = AppState
//    
//    func handleAction(action: Action, state: ReducerStateType?) -> ReducerStateType {
//        switch action {
//        case _ as CountActionIncrease: return AppState(counter: state.map { $0.counter + 1 } ?? 0)
//        case _ as CountActionDecrease: return AppState(counter: state.map { $0.counter - 1 } ?? 0)
//        default: return AppState(counter: 0)
//        }
//    }
//    
//}

extension ArticlesState {
    struct Reducer: ReSwift.Reducer {
        typealias ReducerStateType = AppState
        func handleAction(action: Action, state: ReducerStateType?) -> ReducerStateType {
            let prevState = state ?? AppState()
            let prevArticleState = prevState.article
            var nextState = prevState
            var nextArticleState = nextState.article
            
            switch action {
            case is RequestGetArticles:
                nextArticleState.fetchStatus = .Fetching
            case let action as ResponseGetArticles:
                nextArticleState.fetchStatus = .Success
//                nextArticleState.tweets = prevArticleState.fetchStatus == .Refresh ? action.tweets : TweetsReducerHelper.mergeTweets(prevTimeineState.tweets, nextTweets: action.tweets)
//                nextTimelineState.sinceId = nextTimelineState.tweets?.first?.tweetID
                nextArticleState.articles = action.articles
                nextArticleState.maxId = String(nextArticleState.articles?.last?.id)
                
            case let action as ErrorGetArticles:
                nextArticleState.fetchStatus = .Error
                nextArticleState.error = action.error
                
//            case let action as LikedTweetsState.ResponsePostLikeAction:
//                if let tweets = nextTimelineState.tweets {
//                    nextTimelineState.tweets = TweetsReducerHelper.updateLikedTweet(tweets, likedTweet: action.tweet)
//                }
//                
//            case let action as LikedTweetsState.ResponseDeleteLikeAction:
//                if let tweets = nextTimelineState.tweets {
//                    nextTimelineState.tweets = TweetsReducerHelper.updateLikedTweet(tweets, likedTweet: action.tweet)
//                }
                
            default:
                break
            }
            
            nextState.article = nextArticleState
            return nextState
        }
    }
}