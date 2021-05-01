//
//  Optional+String.swift
//  MySpotify
//
//  Created by Marjan on 2/10/1400 AP.
//

import Foundation

extension Optional where Wrapped == String{
    
    var isNilOrEmpty: Bool{
        
        guard let str = self else {
            return true
        }
        
        return str.isEmpty
        
    }
    
}
