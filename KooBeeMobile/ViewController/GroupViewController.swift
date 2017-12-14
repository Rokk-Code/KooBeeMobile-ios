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
    
    var searchkeyword: String?
    
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
    
    private var isLoading = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setSearchBar()

        load()
        
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
        
        let refreshButton: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.refresh , target: self, action: #selector(buttonTapped(sender:)))
        self.navigationItem.setRightBarButton(refreshButton, animated: true)
        self.title = "団体"
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
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let currentOffsetY = scrollView.contentOffset.y
        let maxOffset = scrollView.contentSize.height - scrollView.frame.height
        let distanceToBottom = maxOffset - currentOffsetY
        
        if distanceToBottom < 400 && isLoading == false {
            isLoading = true
            loadmore()
        }
    }
    
    private func load() {
        let params: [String: Any] = [
            "limit" : 30,
            "keywords": searchkeyword ?? ""
        ]
        viewmodel.fetchGroups(params: params)
            .onSuccess { [weak self] data in
                self?.groups = data.groups
                self?.tableView.reloadData()
                self?.isLoading = false
            }
            .onFailure { [weak self] error in
                // self?.showErrorAlert(error.localizedDescription, completion: nil
                self?.isLoading = false
        }
 
        
    }
    
    private func loadmore() {
        let params: [String: Any] = [
            "limit" : 20,
            "range" : groups.count
        ]

        viewmodel.fetchGroups(params: params)
            .onSuccess { [weak self] data in
                self?.groups.append(contentsOf: data.groups)
                self?.tableView.reloadData()
                self?.isLoading = false
            }
            .onFailure { [weak self] error in
                // self?.showErrorAlert(error.localizedDescription, completion: nil
                self?.isLoading = false
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
    
    @IBAction private func buttonTapped(sender: AnyObject) {
//        let storyboard: UIStoryboard = UIStoryboard(name: "Setting", bundle: nil)
//        if let nextVC: SettingViewController = storyboard.instantiateViewController(withIdentifier: "SettingViewController") as? SettingViewController {
//            navigationController?.pushViewController( nextVC, animated: true)
//        }
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
        let storyboard: UIStoryboard = UIStoryboard(name: "GroupOutline", bundle: nil)
        if let nextVC: GroupOutlineViewController = storyboard.instantiateViewController(withIdentifier: "GroupOutlineViewController") as? GroupOutlineViewController {
            if search.isActive {
                nextVC.group = filteredGroups[indexPath.row]
            } else {
                nextVC.group = groups[indexPath.row]
            }
            navigationController?.pushViewController(nextVC, animated: true)
        }
    }
}

extension GroupViewController: StoryboardLoadable {}
