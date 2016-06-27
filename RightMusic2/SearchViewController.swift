//
//  SearchViewController.swift
//  RightMusic2
//
//  Created by Guilherme Marques on 6/24/16.
//  Copyright © 2016 Guilherme Marques. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource {

    var searchView: SearchView!
    var searchActive = false
    var ref = DataService.getRTDBSingleton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchView = SearchView(view: view, parent: self)
        self.navigationController?.navigationBar.hidden = true
        
        // Do any additional setup after loading the view.
    }
    
    // MARK: SearchBar Delegate
    
    func searchBarShouldBeginEditing(searchBar: UISearchBar) -> Bool {
        return true
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchActive = true
    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        searchActive = false
    }
    
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        searchActive = true
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        
//        filtered = data.filter({ (text) -> Bool in
//            let tmp: NSString = text
//            let range = tmp.rangeOfString(searchText, options: NSStringCompareOptions.CaseInsensitiveSearch)
//            return range.location != NSNotFound
//        })
//        if(filtered.count == 0){
//            searchActive = false
//        } else {
//            searchActive = true
//        }
        ref.child("musics")
            .queryOrderedByChild("name")
            .queryStartingAtValue(searchText)
            .observeSingleEventOfType(.Value, withBlock: { (snapshot) -> Void in
//                var name = snapshot["name"]
                
                
            })
        self.searchView.tableViewMusic.reloadData()
        
    }
    

    // MARK: TableView Delegate and DataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }

}
