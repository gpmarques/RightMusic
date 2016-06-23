//
//  MusicDAO.swift
//  RightMusic2
//
//  Created by Guilherme Marques on 6/14/16.
//  Copyright © 2016 Guilherme Marques. All rights reserved.
//

import Foundation

class MusicDAO {
    
    let ref = DataService.getRTDBSingleton()
    private static let musicDAO = MusicDAO()
    
    private init() { }
    
    func createMusic(mid: String, name: String, chords: String, genre: String, tone: String, lyrics: String) {
        let musicDic = ["name": name, "chords": chords, "lyrics": lyrics, "genre": genre, "tone": tone]
        ref.child("musics").child(mid).setValue(musicDic)
    }
    
    static func getSingleton() -> MusicDAO {
        return musicDAO
    }

}