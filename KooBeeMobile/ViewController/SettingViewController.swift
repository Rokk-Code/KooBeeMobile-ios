//
//  SettingViewController.swift
//  KooBeeMobile
//
//  Created by pipinosuke on 2017/11/22.
//  Copyright © 2017年 rokkocode. All rights reserved.
//

import UIKit

class SettingViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
 fileprivate let kSettingsItems = [ "お知らせ&今後の機能について", "開発者情報", "知るカフェ" ]
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kSettingsItems.count
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}
