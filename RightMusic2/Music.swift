//
//  Music.swift
//  RightMusic2
//
//  Created by Guilherme Marques on 6/15/16.
//  Copyright © 2016 Guilherme Marques. All rights reserved.
//

import Foundation

class Music {
    
    private var name, chords, lyrics, genre: String, tone: String
    
    init(name: String, chords: String, lyrics: String, genre: String, tone: String) {
        self.name = name
        self.chords = chords
        self.lyrics = lyrics
        self.genre = genre
        self.tone = tone
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
    
    func getLyrics() -> String {
        return lyrics
    }
    
}