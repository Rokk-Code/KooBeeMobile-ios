//
//  GetArticlesRequest.swift
//  KooBeeMobile
//
//  Created by pipinosuke on 2017/12/09.
//  Copyright © 2017年 rokkocode. All rights reserved.
//

import Foundation
import APIKit
import SwiftyJSON

struct GetArticlesRequest: HerokuRequest {
    typealias Response =  (max: Int, articles: [Article])
    
    let queryParameters: [String : Any]?
    var method: HTTPMethod { return .get }
    var path: String { return "/articles" }
    
    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> (max: Int, articles: [Article]) {
        let json = JSON(object)
        
        let max = 0
        let articles = json[].arrayValue.map { Article(json: $0) }
        return (max, articles)
    }
}
