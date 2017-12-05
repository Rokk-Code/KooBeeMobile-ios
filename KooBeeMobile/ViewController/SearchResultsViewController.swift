//
//  SearchResultsViewController.swift
//  KooBeeMobile
//
//  Created by pipinosuke on 2017/12/01.
//  Copyright © 2017年 rokkocode. All rights reserved.
//

import UIKit

class SearchResultViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var filteredGroups: [Group] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.register(UINib(nibName: "GroupTableViewCell", bundle: nil), forCellReuseIdentifier: "GroupTableViewCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension SearchResultViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.navigationItem.searchController?.searchBar.text else { return }
        //print("-----------------------\(searchText)")
        
        if searchText.count == 0 { return }
        
        let params: [String: Any] = [
            "keywords" : "\(searchText)",
        ]
        
        GroupViewModel().searchGroups(params: params)
            .onSuccess { [weak self] data in
                self?.filteredGroups = data.groups
                
                self?.tableView.reloadData()
            }
            .onFailure { [weak self] error in
                // self?.showErrorAlert(error.localizedDescription, completion: nil
        }
    }
}

extension SearchResultViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredGroups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: GroupTableViewCell = tableView.dequeueReusableCell(withIdentifier: "GroupTableViewCell", for: indexPath) as! GroupTableViewCell
        cell.bindData(group: filteredGroups[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard: UIStoryboard = UIStoryboard(name: "GroupDetail", bundle: nil)
        if let nextVC: GroupDetailViewController = storyboard.instantiateViewController(withIdentifier: "GroupDetailViewController") as? GroupDetailViewController {
            nextVC.group = filteredGroups[indexPath.row]
            navigationController?.pushViewController(nextVC, animated: true)
        }
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


