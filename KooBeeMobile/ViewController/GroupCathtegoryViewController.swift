//
//  GroupCathtegoryViewController.swift
//  KooBeeMobile
//
//  Created by pipinosuke on 2017/12/14.
//  Copyright © 2017年 rokkocode. All rights reserved.
//

import UIKit

class GroupCathtegoryViewController: UIViewController {

    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var collectionView: UICollectionView!
    
    let kGroupCathegories = [
        [
        "野球",
        "サッカー",
        "テニス",
        "ラクロス",
        "アメフト",
        "バスケ",
        "バレー",
        "ハンドボール",
        "マイナースポーツ",
        "バドミントン",
        "卓球",
        "ホッケー",
        "スカイスポーツ",
        "オールラウンド",
        "武道・武術・射的",
        "マリンスポーツ",
        "陸上",
        "モータースポーツ",
        "ウィンタースポーツ",
        "アウトドア",
        "ダンス",
        "その他"
        ], [
            "音楽",
            "パフォーマンス",
            "文化",
            "国際",
            "社会学系",
            "科学・工学・数学",
            "グルメ",
            "スポーツ観戦",
            "旅行",
            "ホビー",
            "アート・カメラ",
            "ボランティア",
            "マスコミ",
            "大学祭・イベント",
            "その他"
        ]
    ]
    
    @IBAction func segmentTapped(_ sender: Any) {
        collectionView.reloadData()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.register(UINib(nibName: "GroupCathegoryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "GroupCathegoryCollectionViewCell")
        segmentControl.setTitle("運動系", forSegmentAt: 0)
        segmentControl.setTitle("文化系", forSegmentAt: 1)
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
    //セルの行間
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    // セルの横間隔
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 8, bottom: 0, right: 8)
    }

}

// MARK: - Collection view data source
extension GroupCathtegoryViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: GroupCathegoryCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "GroupCathegoryCollectionViewCell", for: indexPath) as! GroupCathegoryCollectionViewCell
        let selectedIndex = segmentControl.selectedSegmentIndex
        cell.binData(cathegoryName: kGroupCathegories[selectedIndex][indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let selectedIndex = segmentControl.selectedSegmentIndex
        return kGroupCathegories[selectedIndex].count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let nextVC: GroupViewController = Utils.createViewController()
        let selectedIndex = segmentControl.selectedSegmentIndex
        nextVC.searchkeyword = kGroupCathegories[selectedIndex][indexPath.row]
        navigationController?.pushViewController(nextVC, animated: true)
    }
}
