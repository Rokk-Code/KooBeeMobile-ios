//
//  JSONDataParser.swift
//  KooBeeMobile
//
//  Created by pipinosuke on 2017/12/12.
//  Copyright © 2017年 rokkocode. All rights reserved.
//

import Foundation
import APIKit

class DecodableDataParser: APIKit.DataParser {
    var contentType: String? {
        return "application/json"
    }
    
    func parse(data: Data) throws -> Any {
        return data
    }
}
