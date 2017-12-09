//
//  ArticleTableViewCell.swift
//  KooBeeMobile
//
//  Created by pipinosuke on 2017/12/09.
//  Copyright © 2017年 rokkocode. All rights reserved.
//

import UIKit
import SDWebImage

class ArticleTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var publisherImage: UIImageView!
    
    let stringAttributes1: [NSAttributedStringKey : Any] = [
        .font : UIFont.boldSystemFont(ofSize: 24.0) ,
        .foregroundColor : UIColor.black
    ]
    
    let stringAttributes2: [NSAttributedStringKey : Any] = [
        .font : UIFont.boldSystemFont(ofSize: 20.0)
    ]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
     
        publisherImage.translatesAutoresizingMaskIntoConstraints = true
        publisherImage.frame = CGRect.init(x: 0, y: 8, width: CGFloat(thumbImage.frame.height / 5), height: CGFloat(thumbImage.frame.height / 9))

        
        titleLabel.numberOfLines = 0
        titleLabel.sizeToFit()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func bindData(article: Article) {
        let string1 = NSAttributedString(string: "[\(article.name)]", attributes: stringAttributes1)
        let string2 = NSAttributedString(string: article.aboutText, attributes: stringAttributes2)
        
        let mutableAttributedString = NSMutableAttributedString()
        mutableAttributedString.append(string1)
        mutableAttributedString.append(string2)
        
        titleLabel.attributedText = mutableAttributedString
 //       titleLabel.text = "[\(article.name)] \(article.copyText)"

        guard let thumbUrl = URL(string: article.thumbURL) else { return }
        thumbImage.sd_setImage(with: thumbUrl, completed: nil)
    }
    
}