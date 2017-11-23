//
//  GroupeViewController.swift
//  KooBeeMobile
//
//  Created by pipinosuke on 2017/11/22.
//  Copyright © 2017年 rokkocode. All rights reserved.
//

import UIKit

class GroupViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.register(UINib(nibName: "GroupeTableViewCell", bundle: nil), forCellReuseIdentifier: "GroupeTableViewCell")
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

}

extension GroupViewController: UITableViewDelegate, UITableViewDataSource  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: GroupeTableViewCell = tableView.dequeueReusableCell(withIdentifier: "GroupeTableViewCell", for: indexPath) as! GroupeTableViewCell
        cell.bindData()
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard: UIStoryboard = UIStoryboard(name: "GroupDetail", bundle: nil)
        if let nextVC: GroupDetailViewController = storyboard.instantiateViewController(withIdentifier: "GroupDetailViewController") as? GroupDetailViewController {
            navigationController?.pushViewController(nextVC, animated: true)
        }
        
    }
}
