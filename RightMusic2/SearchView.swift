//
//  SearchView.swift
//  RightMusic2
//
//  Created by Guilherme Marques on 6/24/16.
//  Copyright © 2016 Guilherme Marques. All rights reserved.
//

import UIKit

class SearchView: UIView {

    var searchBar: UISearchBar!
    var tableViewMusic: UITableView!
    
    init(view: UIView, parent: SearchViewController) {
        super.init(frame: view.frame)
    
        let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.size.height
        let placeholderFont = UIFont(name: "SFUIDisplay-Ultralight", size: 16)
        
        // MARK: Background
        
        let backgroundImage = UIImageView(frame: UIScreen.mainScreen().bounds)
        backgroundImage.image = UIImage(named: "darkBackground")
        
        // MARK: SearchBar
        
        searchBar = UISearchBar(frame: CGRectMake(view.frame.width*0.0, view.frame.height*0.0, view.frame.width*1.0, view.frame.height*0.09375 + statusBarHeight))
        searchBar.enablesReturnKeyAutomatically = true
        searchBar.delegate = parent
        searchBar.placeholder = "Search"
        searchBar.userInteractionEnabled = true
        searchBar.showsCancelButton = false
//        searchBar.barTintColor = dark
        searchBar.barStyle = .Default
        searchBar.searchBarStyle = .Minimal
        let textFieldInsideSearchBar = searchBar.valueForKey("searchField") as! UITextField
        textFieldInsideSearchBar.attributedPlaceholder = attributesPlaceholder("Search", font: placeholderFont!)
        textFieldInsideSearchBar.borderStyle = .None
        textFieldInsideSearchBar.clearButtonMode = .Never
        textFieldInsideSearchBar.textColor = UIColor.whiteColor()
        
        // MARK: TableView
        tableViewMusic = UITableView(frame:  CGRectMake(view.frame.width*0.0 - 8,view.frame.height*0.0977113, view.frame.width,view.frame.height*1.60156))
        tableViewMusic.delegate      =   parent
        tableViewMusic.dataSource    =   parent
        tableViewMusic.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableViewMusic.backgroundColor = dark
        
        // MARK: addsubview
        
        view.addSubview(backgroundImage)
        view.addSubview(searchBar)
        view.addSubview(tableViewMusic)
        
    }
    
    
    private func attributesPlaceholder(string: String, font: UIFont) -> NSAttributedString {
        let attributedPlaceholder = NSAttributedString(string: string, attributes: [NSForegroundColorAttributeName : UIColor.whiteColor(), NSFontAttributeName : font])
        
        return attributedPlaceholder
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
