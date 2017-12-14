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
    @IBOutlet weak var cathegoryLabel: UILabel!
    //    enum groupType : String{
//        case baseball = "野球"
//        case soccor = "サッカー"
//        case tennis = "テニス"
//        case lacrosse = "ラクロス"
//        case rugby = "ラグビー"
//        case basketball = "バスケ"
//        case balleyball = "バレー"
//        case handball = "ハンドボール"
//        case minorsports = "マイナースポーツ"
//        case badminton = "バドミントン"
//        case tabletennis = "卓球"
//        case hokkey = "ホッケー"
//        case skysports = "スカイスポーツ"
//        case allround = "オールラウンド"
//        case fight = "武道・射的"
//        case marin = "マリンスポーツ"
//        case athletic = "陸上"
//        case mortor = "モータースポーツ"
//        case winter = "ウィンタースポーツ"
//        case outdoor = "アウトドア"
//        case dance = "ダンス"
//        case other = "その他"
//
////        func createIconName() -> String {
////            switch self {
////            case .baseball:
////                return "baseball-icon"
////            case .soccor:
////                return "soccor-icon"
////            case .tennis:
////                return "tennis-icon"
////            }
////        }
//    }
    
    static var cellSize: CGSize {
        let width = UIScreen.main.bounds.width / 2 - 10
//        if width * 1.35 > 250 { return CGSize(width: width, height: 230) }
//        if width * 1.35 > 210 { return CGSize(width: width, height: width * 1.35) }
        return CGSize(width: width, height: width)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func binData(cathegoryName: String) {
        cathegoryLabel.text = "#\(cathegoryName)"
        imageView.image = UIImage(named: cathegoryName)
//        if let imageName = groupType(rawValue: cathegoryName)?.createIconName() {
//            imageView.image = UIImage(named: imageName)
//        }
    }
}
