//
//  StoryboardLoadable.swift
//  KooBeeMobile
//
//  Created by pipinosuke on 2017/12/14.
//  Copyright © 2017年 rokkocode. All rights reserved.
//

import UIKit

protocol StoryboardLoadable  {
    static var storyboardName: String { get }
}

extension StoryboardLoadable where Self: UIViewController {
    static var storyboardName: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!.replacingOccurrences(of: "ViewController", with: "")
    }
}
