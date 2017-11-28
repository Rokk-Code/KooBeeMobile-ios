//
//  APIManager.swift
//  KooBeeMobile
//
//  Created by pipinosuke on 2017/11/27.
//  Copyright © 2017年 rokkocode. All rights reserved.
//

import SwiftyJSON
import APIKit
import BrightFutures

struct APIManager {
    
    static func send<T: HerokuRequest>(request: T, callbackQueue queue: CallbackQueue? = nil) -> Future<T.Response, SessionTaskError> {
        
        let promise = Promise<T.Response, SessionTaskError>()
        
        Session.send(request, callbackQueue: queue) { result in
            
            switch result {
            case let .success(data):
                promise.success(data)
                
            case let .failure(error):
                promise.failure(error)
            }
        }
        
        return promise.future
    }
    
}

