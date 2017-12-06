//
//  GroupeViewController.swift
//  KooBeeMobile
//
//  Created by pipinosuke on 2017/11/22.
//  Copyright © 2017年 rokkocode. All rights reserved.
//

import UIKit
import SwiftRefresher

class GroupViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var viewmodel = GroupViewModel()
    
    private var groups: [Group] {
        get {
            return viewmodel.groups
        }
        set(newValue) {
            viewmodel.groups = newValue
        }
    }
    
    private var filteredGroups = [Group]()
    
    private var search = UISearchController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        load()
        
        setSearchBar()
        
        tableView.register(UINib(nibName: "GroupTableViewCell", bundle: nil), forCellReuseIdentifier: "GroupTableViewCell")
        tableView.srf_addRefresher(createRefresherView())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    private func setSearchBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .automatic
        
        self.title = "団体一覧"
        
        //追記部分
        search  = UISearchController(searchResultsController: nil)
        search.dimsBackgroundDuringPresentation = false
        search.searchResultsUpdater = self
        navigationItem.searchController = search
        //SearchResultControllerでやりたい
//        search = UISearchController(searchResultsController: SearchResultViewController())
//        search.searchResultsUpdater = SearchResultViewController()
//        search.dimsBackgroundDuringPresentation = false
//        navigationItem.searchController = search
    }
    
    private func load() {
        let params: [String: Any] = [
            "limit" : 30,
        ]
        viewmodel.fetchGroups(params: params)
            .onSuccess { [weak self] data in
                self?.groups = data.groups
                self?.tableView.reloadData()
            }
            .onFailure { [weak self] error in
                // self?.showErrorAlert(error.localizedDescription, completion: nil
        }

    }
    
    fileprivate func createRefresherView() -> Refresher {
        let refresher = Refresher { [weak self] in
            
            guard let `self` = self else { return }
            
            // ちらつき防止のためdelayを入れている
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.load()
                self.tableView.srf_endRefreshing()
                
            }
        }
        
        refresher.createCustomRefreshView { () -> SwfitRefresherEventReceivable in
            return SimpleRefreshView(activityIndicatorViewStyle: .gray, pullingImage: nil)
        }
        
        return refresher
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

extension GroupViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text else { return }
        
        let params: [String: Any] = [
            "keywords" : searchText,
        ]
            
        viewmodel.searchGroups(params: params)
            .onSuccess { [weak self] data in
                self?.filteredGroups = data.groups
                
                self?.tableView.reloadData()
            }
            .onFailure { [weak self] error in
                // self?.showErrorAlert(error.localizedDescription, completion: nil
        }
        tableView.reloadData()
    }
}

extension GroupViewController: UITableViewDelegate, UITableViewDataSource  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        if search.isActive  {
            return filteredGroups.count
        } else {
            return groups.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: GroupTableViewCell = tableView.dequeueReusableCell(withIdentifier: "GroupTableViewCell", for: indexPath) as! GroupTableViewCell

        if search.isActive {
            cell.bindData(group: filteredGroups[indexPath.row])
        } else {
            cell.bindData(group: groups[indexPath.row])
        }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard: UIStoryboard = UIStoryboard(name: "GroupDetail", bundle: nil)
        if let nextVC: GroupDetailViewController = storyboard.instantiateViewController(withIdentifier: "GroupDetailViewController") as? GroupDetailViewController {
            if search.isActive {
                nextVC.group = filteredGroups[indexPath.row]
            } else {
                nextVC.group = groups[indexPath.row]
            }
            navigationController?.pushViewController(nextVC, animated: true)
        }
    }
}
