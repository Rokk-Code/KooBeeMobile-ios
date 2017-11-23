//
//  MainTabBarController.swift
//  KooBeeMobile
//
//  Created by pipinosuke on 2017/11/22.
//  Copyright © 2017年 rokkocode. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    private let kTabNames = [ "Group" , "Setting"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        registerViewControllers()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func registerViewControllers() {
        
        var viewControllers: [UINavigationController] = []
        
        for name in kTabNames {
            let storyboard = UIStoryboard(name: name, bundle: nil)
            let viewController = storyboard.instantiateInitialViewController() as! UINavigationController
            viewControllers.append(viewController)
        }
        self.setViewControllers(viewControllers, animated: false)
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
