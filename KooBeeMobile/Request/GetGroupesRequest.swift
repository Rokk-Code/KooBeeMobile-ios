//
//  GetGroupesRequest.swift
//  KooBeeMobile
//
//  Created by pipinosuke on 2017/11/27.
//  Copyright © 2017年 rokkocode. All rights reserved.
//

import Foundation
import APIKit
import SwiftyJSON

struct GetGroupsRequest: HerokuRequest {
    typealias Response =  (max: Int, groups: [Group])
    
    let queryParameters: [String : Any]?
    var method: HTTPMethod { return .get }
    var path: String { return "/groups" }
    
    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> (max: Int, groups: [Group]) {
        let json = JSON(object)
        
        let max = 0
        let groups = json[].arrayValue.map { Group(json: $0) }
        return (max, groups)
    }
}
