//
//  SearchViewController.swift
//  RightMusic2
//
//  Created by Guilherme Marques on 6/24/16.
//  Copyright © 2016 Guilherme Marques. All rights reserved.
//

import UIKit
import Firebase
import DZNEmptyDataSet

class SearchViewController: UIViewController, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource, DZNEmptyDataSetSource,DZNEmptyDataSetDelegate  {
    
    var searchView: SearchView!
    var searchActive = false
    var ref = DataService.getRTDBSingleton()
    var filtered: [String] = []
    var data: [String] = []
    var musics: [Music] = []
    var filteredMusics: [Music] = []
    
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
        musics = []
        let query = ref.child("musics").queryOrderedByChild("name").queryStartingAtValue(searchText)
        query.observeEventType(.Value, withBlock: {(snapshot) -> Void in
            
            print("SNAPSHOT: ")
            print(snapshot)
            if let snapshots = snapshot.children.allObjects as? [FIRDataSnapshot] {
                for snap in snapshots {
                    print("SNAP: ")
                    print(snap)
                    
                    if let musicDic = snap.value as? [String: String] {
                        guard let name = musicDic["name"] else {
                            break
                        }
                        guard let tone = musicDic["tone"] else {
                            break
                        }
                        guard let chords = musicDic["chords"] else {
                            break
                        }
                        guard let genre = musicDic["genre"] else {
                            break
                        }
                        guard let lyrics = musicDic["lyrics"] else {
                            break
                        }
                        
                        if !self.data.contains(name) {
                            self.data.append(name)
                        }
                        
                        let music = Music(name: name, chords: chords, lyrics: lyrics, genre: genre, tone: tone)
                        if !self.musics.contains({ (m) -> Bool in
                            if m.getName() == music.getName() && music.getLyrics() == m.getLyrics() {
                                return true
                            }
                            return false
                        
                        }) {
                            self.musics.append(music)
                        }
                        print("MUSIC: ")
                        print(music)
                        
                    }
                }
            }
        
        })
        print(query)
        
        filtered = data.filter({ (text) -> Bool in
            let tmp: NSString = text
            let range = tmp.rangeOfString(searchText, options: NSStringCompareOptions.CaseInsensitiveSearch)
            return range.location != NSNotFound
        })
        
        data = filtered
        
        filteredMusics = musics.filter({ (music) -> Bool in
        
            let mTmp: Music = music
            if mTmp.getName() == searchText {
                return true
            }
            return false
            
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
    
    // MARK: Empty DataSet DataSource
    
    func imageForEmptyDataSet(scrollView: UIScrollView!) -> UIImage! {
        return UIImage(named: "searchImage")
    }
    
    func titleForEmptyDataSet(scrollView: UIScrollView!) -> NSAttributedString! {
        let text: NSString = "Find your favourite music"
        let font = UIFont(name: "SFUIDisplay-Regular", size: 16)
        let attributes = NSAttributedString(string: text as String, attributes: [NSForegroundColorAttributeName : UIColor.whiteColor(), NSFontAttributeName : font!])
        
        return attributes
    }
    
    func descriptionForEmptyDataSet(scrollView: UIScrollView!) -> NSAttributedString! {
        let description: NSString = "search for songs, artists and genres"
        let font = UIFont(name: "SFUIDisplay-Ultralight", size: 12)
        let paragraph = NSMutableParagraphStyle()
        paragraph.alignment = .Center
        paragraph.lineBreakMode = .ByWordWrapping
        
        let attributes: NSDictionary = [NSFontAttributeName: font!, NSForegroundColorAttributeName: UIColor.whiteColor(),
                          NSParagraphStyleAttributeName: paragraph]
        
        return NSAttributedString(string: description as String, attributes: attributes as? [String : AnyObject])
        
    }
    
    
    func verticalOffsetForEmptyDataSet(scrollView: UIScrollView!) -> CGFloat {
        return -self.view.frame.height/2.0
    }

    // MARK: Empty DataSet Delegate
    
    func emptyDataSetShouldDisplay(scrollView: UIScrollView!) -> Bool {
        return true
    }
    
    func emptyDataSetShouldAllowTouch(scrollView: UIScrollView!) -> Bool {
        return true
    }
    
}
