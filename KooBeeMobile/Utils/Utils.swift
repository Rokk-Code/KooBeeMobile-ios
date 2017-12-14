//
//  Utils.swift
//  KooBeeMobile
//
//  Created by pipinosuke on 2017/12/14.
//  Copyright © 2017年 rokkocode. All rights reserved.
//

import UIKit

class Utils {
    static func createViewController<T: StoryboardLoadable>() -> T {
        let storyboard = UIStoryboard(name: T.storyboardName , bundle: nil  )
        let vc = storyboard.instantiateInitialViewController() as! T
        return vc
    }
}
