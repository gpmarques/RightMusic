//
//  Music.swift
//  RightMusic2
//
//  Created by Guilherme Marques on 6/15/16.
//  Copyright © 2016 Guilherme Marques. All rights reserved.
//

import Foundation

class Music {
    
    private var name, chords, genre: String
    
    init(name: String, chords: String, genre: String) {
        self.name = name
        self.chords = chords
        self.genre = genre
    }
    
    func getName() -> String {
        return name
    }

    func getChords() -> String {
        return chords
    }
    
    func getGenre() -> String {
        return genre
    }
    
}