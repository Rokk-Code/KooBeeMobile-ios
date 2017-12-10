//
//  GroupOutlineViewController.swift
//  KooBeeMobile
//
//  Created by pipinosuke on 2017/12/10.
//  Copyright © 2017年 rokkocode. All rights reserved.
//

import UIKit
import SDWebImage

class GroupOutlineViewController: UIViewController {

    @IBOutlet weak var detailButton: UIButton!
    @IBOutlet weak var thumbImage: UIImageView!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var hpButton: UIButton!
    @IBOutlet weak var fbButton: UIButton!
    @IBOutlet weak var twitterButton: UIButton!
    var group: Group?
    
    
    let stringAttributes1: [NSAttributedStringKey : Any] = [
        .font : UIFont.boldSystemFont(ofSize: 24.0) ,
        .foregroundColor : UIColor.black
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        nameLabel.adjustsFontSizeToFitWidth = true
        nameLabel.attributedText = NSAttributedString(string: group?.name ?? "", attributes: stringAttributes1)
        descLabel.numberOfLines = 0
        descLabel.lineBreakMode = .byWordWrapping
        descLabel.isHidden = true
        // とりあえずgroup?.thumbURLの変わりにダミーを入れてる
        thumbImage.sd_setImage(with: URL(string: "http://weebee1212.com/sp/dantai/images/photo/1/photo1.jpg"
), completed: nil)
    
        
        detailButton.setTitle("KooBeeで詳しく見る", for: UIControlState.normal)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func detailButtonTapped(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "GroupDetail", bundle: nil)
        if let nextVC: GroupDetailViewController = storyboard.instantiateViewController(withIdentifier: "GroupDetailViewController") as? GroupDetailViewController {
            nextVC.group = group
            navigationController?.pushViewController(nextVC, animated: true)
            
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
