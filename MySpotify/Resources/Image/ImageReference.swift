//
//  ImageReference.swift
//  MySpotify
//
//  Created by Marjan on 2/10/1400 AP.
//

import Foundation
import SwiftUI

enum ImageReference: String{
    case musicalNote = "ic_musical_note"
    case spotifyCircle = "ic_spotify_circle"
    case calendar = "ic_calendar"
}

extension ImageReference {
    
    var image: Image {
        return Image(self.rawValue)
    }
    
}
