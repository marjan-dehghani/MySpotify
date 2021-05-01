//
//  Auth.swift
//  MySpotify
//
//  Created by Marjan on 2/10/1400 AP.
//

import Foundation

enum Auth: EndPoint{
    case token
}

extension Auth{
    
    var baseURL: URL{
        return URL(string: "https://accounts.spotify.com/api/")!
    }
    
    var path: String{
        switch self {
        case .token:
            return "token"
        }
    }
    
    var method: HTTPMethod{
        switch self {
        case .token:
            return .post
        }
    }
    
    var parameters: Parameters?{
        switch self {
        case .token:
            return ["grant_type": "client_credentials"]
        }
    }
    
    var headers: HTTPHeaders?{
        switch self {
        case .token:
            let username = Constants.Spotify.CLIENT_ID
            let password = Constants.Spotify.CLIENT_SECRET
            let loginString = String(format: "%@:%@", username, password)
            let loginData = loginString.data(using: String.Encoding.utf8)!
            let base64LoginString = loginData.base64EncodedString()
            return ["Authorization": "Basic " + base64LoginString,
                    "Content-Type": "application/x-www-form-urlencoded"]
        }
    }
    
    var task: Task{
        switch self {
        case .token:
            return .requestParameters
        }
    }
    
    var parametersEncoding: ParametersEncoding?{
        switch self {
        case .token:
            return .url
        }
    }
    
}
