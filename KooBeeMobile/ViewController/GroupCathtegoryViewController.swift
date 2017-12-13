//
//  GroupCathtegoryViewController.swift
//  KooBeeMobile
//
//  Created by pipinosuke on 2017/12/14.
//  Copyright © 2017年 rokkocode. All rights reserved.
//

import UIKit

class GroupCathtegoryViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let kGroupCathegories: Array = [ "野球", "サッカー", "テニス" ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        collectionView.register(UINib(nibName: "GroupCathegoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "GroupCathegoryCollectionViewCell")
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

// MARK: - Collection view flow Layout
extension GroupCathtegoryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return GroupCathegoryCollectionViewCell.cellSize
    }
}

// MARK: - Collection view data source
extension GroupCathtegoryViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: GroupCathegoryCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "GroupCathegoryCollectionViewCell", for: indexPath) as! GroupCathegoryCollectionViewCell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return kGroupCathegories.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //
    }
}
