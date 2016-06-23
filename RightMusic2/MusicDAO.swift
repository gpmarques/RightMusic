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
    
    func createMusic(mid: String, name: String, chords: String, genre: String) {
        let musicDic = ["name": name, "chords": chords, "genre": genre]
        ref.child("musics").child(mid).setValue(musicDic)
    }

}