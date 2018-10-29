//
//  Song.swift
//  rb685_p4
//
//  Created by Trey Burrell on 10/28/18.
//  Copyright © 2018 Trey. All rights reserved.
//

import UIKit

class Song {
    
    var name: String
    var artist: String
    var album: String
    var image: UIImage
    
    init(name: String, artist: String, album: String, image: UIImage) {
        self.name = name
        self.artist = artist
        self.album = album
        self.image = image
    }
    
}
