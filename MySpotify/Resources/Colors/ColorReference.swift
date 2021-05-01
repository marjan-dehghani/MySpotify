//
//  ColorReference.swift
//  MySpotify
//
//  Created by Marjan on 2/10/1400 AP.
//

import Foundation
import SwiftUI

enum ColorReference: String{
    case purple = "Purple"
    case pink = "Pink"
    case lightPink = "LightPink"
    case grey = "Grey"
    case green = "Green"
}

extension ColorReference {
    
    var color: Color {
        return Color(self.rawValue)
    }
    
}
