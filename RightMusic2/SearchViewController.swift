//
//  SearchViewController.swift
//  RightMusic2
//
//  Created by Guilherme Marques on 6/24/16.
//  Copyright © 2016 Guilherme Marques. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource  {
    
    var searchView: SearchView!
    var searchActive = false
    var ref = DataService.getRTDBSingleton()
    var filtered: [String] = []
    var data: [String] = ["Big Me","Smoke On The Water", "Hello", "I'm Yours", "Can't Stop"]
    
    //    var musics: [Music] = []
    //        ref.child("musics/name").queryStartingAtValue(searchText)
    //            .observeSingleEventOfType(.Value, withBlock: {(snapshot) -> Void in
    //                print("entrei")
    //                print(snapshot)
    //                for child in snapshot.children {
    //                    print(String(child.value["name"]))
    //                    let music = Music(name: String(child.value["name"]), chords: String(child.value["chords"]), lyrics: String(child.value["lyrics"]) , genre: String(child.value["genre"]), tone: String(child.value["tone"]))
    //                    print(music.getName())
    //                    self.data.append(music.getName())
    //                    self.musics.append(music)
    //                }
    //
    //
    //            })
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchView = SearchView(view: view, parent: self)
        self.navigationController?.navigationBar.hidden = true
        self.hideKeyboardWhenTappedAround()
    }
    
    // MARK: SearchBar Delegate
    
//    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
//        searchActive = false
//    }
    
    func searchBarShouldBeginEditing(searchBar: UISearchBar) -> Bool {
        return true
    }
    
    func searchBarShouldEndEditing(searchBar: UISearchBar) -> Bool {
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
        
        let query = ref.child("musics").child("name").queryStartingAtValue(searchText)
        print(query)
        
        filtered = data.filter({ (text) -> Bool in
            let tmp: NSString = text
            let range = tmp.rangeOfString(searchText, options: NSStringCompareOptions.CaseInsensitiveSearch)
            return range.location != NSNotFound
        })
        if(filtered.count == 0){
            searchActive = false
        } else {
            searchActive = true
        }
        self.searchView.tableViewMusic.reloadData()
        
    }
    
    // MARK: TableView Delegate and DataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchActive {
            return filtered.count
        }
        return data.count;
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        if searchActive {
            cell.textLabel?.text = filtered[indexPath.row]
        } else {
            cell.textLabel?.text = data[indexPath.row]
        }
        cell.textLabel?.font = UIFont(name: "SFUIDisplay-Regular", size: 12)
        cell.backgroundColor = dark
        cell.textLabel?.textColor = UIColor.whiteColor()
        return cell
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.navigationController?.pushViewController(MusicViewController(), animated: true)
        let cellToDeSelect:UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
        cellToDeSelect.contentView.backgroundColor = dark
    }
    
        // MARK: Keyboard Dismiss
    
        override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
            self.searchView.searchBar.endEditing(true)
            self.searchView.searchBar.resignFirstResponder()
        }
//
//        func textFieldShouldReturn(textField: UITextField) -> Bool {
//            textField.resignFirstResponder()
//            return true
//        }
    
}
