//
//  AppData.swift
//  MySpotify
//
//  Created by Marjan on 2/10/1400 AP.
//

import Foundation

struct AppData {
    
    @Storage(key: Constants.Keys.ACCESS_TOKEN, defaultValue: nil)
    static var token: String?
    
    @Storage(key: Constants.Keys.ACCESS_TOKEN_EXPIRATION, defaultValue: nil)
    static var token_expiration: Int?
    
}
