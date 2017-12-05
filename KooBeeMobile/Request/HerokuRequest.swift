//
//  HerokuRequest.swift
//  KooBeeMobile
//
//  Created by pipinosuke on 2017/11/27.
//  Copyright © 2017年 rokkocode. All rights reserved.
//

import Foundation
import APIKit

protocol HerokuRequest: Request {}

extension HerokuRequest {
    var baseURL: URL  { return URL(string: "https://pipinosuke-api.herokuapp.com/api/v1/")! }
    
}
