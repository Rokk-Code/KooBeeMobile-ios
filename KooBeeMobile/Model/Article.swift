//
//  Article.swift
//  KooBeeMobile
//
//  Created by pipinosuke on 2017/12/09.
//  Copyright © 2017年 rokkocode. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Article {
    let name: String
    let aboutText: String
    let copyText: String
    let thumbURL: String
    let link: String
    
    init(json: JSON) {
        let article = json[]
        name = article["name"].stringValue
        aboutText = article["aboutText"].stringValue
        thumbURL = article["copyText"].stringValue
        copyText = article["thumbURL"].stringValue //api逆にしちゃった
        link = article["link"].stringValue

    }
}
