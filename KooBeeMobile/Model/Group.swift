//
//  Groupe.swift
//  KooBeeMobile
//
//  Created by pipinosuke on 2017/11/22.
//  Copyright © 2017年 rokkocode. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Group{
    let name: String
    let thumbURL: String
    let cathegory: String
    let detailURL: String
    let twitterURL: String
//    let facebookURL: String
    
    init(json: JSON) {
        let group = json[]
        name = group["name"].stringValue
        thumbURL = group["thumbURL"].stringValue
        cathegory = group["cathegory"].stringValue
        detailURL = group["detailURL"].stringValue
        twitterURL = group["twitterURL"].stringValue
    }
}
