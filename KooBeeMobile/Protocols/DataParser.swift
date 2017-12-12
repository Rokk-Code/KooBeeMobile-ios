//
//  DataParser.swift
//  KooBeeMobile
//
//  Created by pipinosuke on 2017/12/12.
//  Copyright © 2017年 rokkocode. All rights reserved.
//

import Foundation
import APIKit

public protocol DataParser {
    var contentType: String? { get }
    func parse(data: Data) throws -> Any
}
