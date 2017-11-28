//
//  GroupTableViewCell.swift
//  KooBeeMobile
//
//  Created by pipinosuke on 2017/11/22.
//  Copyright © 2017年 rokkocode. All rights reserved.
//

import UIKit
import SDWebImage

class GroupTableViewCell: UITableViewCell {
    
    @IBOutlet weak var twitterButton: UIButton!
    @IBOutlet weak var thumb: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cathegoryLabel: UILabel!
    
    var twitterLink: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func twitterTapAction(_ sender: Any) {
        guard let urlStr = twitterLink else {return}
        UIApplication.shared.open(URL(string: urlStr)!, options: [:], completionHandler: nil)
    }
    
    func bindData(group: Group) {
        nameLabel.text = group.name
        cathegoryLabel.text = group.cathegory
        if group.twitterURL == "" {
            twitterButton.isHidden = true
        } else {
            // URLスキーム
            twitterButton.isHidden = false
            twitterLink = group.twitterURL
        }
        guard let thumbURL = URL(string: group.thumbURL) else { return }
        thumb.sd_setImage(with: thumbURL, completed: nil)
        
    }
    
    
}
