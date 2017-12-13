//
//  GroupCathegoryCollectionViewCell.swift
//  KooBeeMobile
//
//  Created by pipinosuke on 2017/12/14.
//  Copyright © 2017年 rokkocode. All rights reserved.
//

import UIKit

class GroupCathegoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var button: UIButton!
    
    static var cellSize: CGSize {
        let width = UIScreen.main.bounds.width / 2 - 18
        if width * 1.35 > 250 { return CGSize(width: width, height: 230) }
        if width * 1.35 > 210 { return CGSize(width: width, height: width * 1.35) }
        return CGSize(width: width, height: 210)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
       // button
    }
}
