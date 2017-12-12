//
//  GetGroupesRequest.swift
//  KooBeeMobile
//
//  Created by pipinosuke on 2017/11/27.
//  Copyright © 2017年 rokkocode. All rights reserved.
//

import Foundation
import APIKit

struct GetGroupsRequest: HerokuRequest {
    typealias Response =  (max: Int, groups: [Group])
    
    let queryParameters: [String : Any]?
    var method: HTTPMethod { return .get }
    var path: String { return "/groups" }
    var dataParser: DataParser {
        return DecodableDataParser()
    }
    
    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> (max: Int, groups: [Group]) {
        guard let groupsData: Data = object as? Data else {
            throw ResponseError.unexpectedObject(object)
        }
        let groups = try JSONDecoder().decode([Group].self, from: groupsData)
        let max = 0
        
        return (max, groups)
    }
    
}




struct SearchGroupsRequest: HerokuRequest {
    typealias Response =  (max: Int, groups: [Group])
    
    let queryParameters: [String : Any]?
    var method: HTTPMethod { return .get }
    var path: String { return "/groups/search" }
    var dataParser: DataParser {
        return DecodableDataParser()
    }
    
    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> (max: Int, groups: [Group]) {
        guard let groupsData: Data = object as? Data else {
            throw ResponseError.unexpectedObject(object)
        }
        let groups = try JSONDecoder().decode([Group].self, from: groupsData)
        let max = 0
        
        return (max, groups)
    }
}
