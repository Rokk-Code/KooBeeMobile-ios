//
//  GroupTableViewCell.swift
//  KooBeeMobile
//
//  Created by pipinosuke on 2017/11/22.
//  Copyright © 2017年 rokkocode. All rights reserved.
//

import UIKit

class GroupTableViewCell: UITableViewCell {
    
    @IBOutlet weak var twitterButton: UIButton!
    @IBOutlet weak var thumb: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        twitterButton.isHidden = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func twitterTapAction(_ sender: Any) {
        // = group.twitterLink
        
    }
    func bindData() {
        nameLabel.text = "ff"
        
        
        //http s://i.vimeocdn.com/portrait/58832_300x300
        
        guard let thumbURL = URL(string: "https://www.biber.com/dta/themes/biber/core/assets/images/no-featured-175.jpg") else { return }
        guard let thumbnail = try? Data(contentsOf: thumbURL) else { return }
        thumb.image = UIImage(data: thumbnail)
    }
    
    
}
