//
//  GroupViewModel.swift
//  KooBeeMobile
//
//  Created by pipinosuke on 2017/11/26.
//  Copyright © 2017年 rokkocode. All rights reserved.
//
import Foundation
import APIKit
import BrightFutures

class GroupViewModel {
    var max: Int = 0
    var groups =  [Group]()
    
    func fetchGroups(params: [String: Any]) -> Future<GetGroupsRequest.Response, SessionTaskError> {
        
        return APIManager.send(request: GetGroupsRequest(queryParameters: params))
    }
    
    func searchGroups(params: [String: Any]) -> Future<SearchGroupsRequest.Response, SessionTaskError> {
        
        return APIManager.send(request: SearchGroupsRequest(queryParameters: params))
    }
}
