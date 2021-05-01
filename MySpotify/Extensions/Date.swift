//
//  Date.swift
//  MySpotify
//
//  Created by Marjan on 2/10/1400 AP.
//

import Foundation

extension Date{
    
    static var currentSecondsSince1970: Int{
        Int(Date().timeIntervalSince1970)
    }
    
    static func isExpired(secondsSince1970: Int) -> Bool{
        return secondsSince1970 < Date.currentSecondsSince1970
    }
    
}
