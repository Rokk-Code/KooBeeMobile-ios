//
//  GetArticlesRequest.swift
//  KooBeeMobile
//
//  Created by pipinosuke on 2017/12/09.
//  Copyright © 2017年 rokkocode. All rights reserved.
//

import Foundation
import APIKit

struct GetArticlesRequest: HerokuRequest {
    typealias Response =  (max: Int, articles: [Article])
    
    let queryParameters: [String : Any]?
    var method: HTTPMethod { return .get }
    var path: String { return "/articles" }
    var dataParser: DataParser {
        return DecodableDataParser()
    }
    
    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> (max: Int, articles: [Article]) {
        
        guard let articlesData: Data = object as? Data else {
            throw ResponseError.unexpectedObject(object)
        }
        let articles = try JSONDecoder().decode([Article].self, from: articlesData)
        let max = 0
        return (max, articles)
    }
}
