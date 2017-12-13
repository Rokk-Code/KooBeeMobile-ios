//
//  Article.swift
//  KooBeeMobile
//
//  Created by pipinosuke on 2017/12/09.
//  Copyright © 2017年 rokkocode. All rights reserved.
//

import Foundation

struct Article: Codable {
    let name: String
    let aboutText: String
    let copyText: String
    let thumbURL: String
    let link: String
}
