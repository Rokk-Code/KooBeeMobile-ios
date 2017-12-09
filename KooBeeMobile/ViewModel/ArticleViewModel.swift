//
//  ArticleViewModel.swift
//  KooBeeMobile
//
//  Created by pipinosuke on 2017/12/09.
//  Copyright © 2017年 rokkocode. All rights reserved.
//
import APIKit
import BrightFutures

class ArticleViewModel {
    var max: Int = 0
    var articles =  [Article]()
    
    func fetchArticles(params: [String: Any]) -> Future<GetArticlesRequest.Response, SessionTaskError> {
        
        return APIManager.send(request: GetArticlesRequest(queryParameters: params))
    }
}

