//
//  BrowseEndpoint.swift
//  MySpotify
//
//  Created by Marjan on 2/10/1400 AP.
//

import Foundation

enum Browse: EndPoint{
    case new_releases(offset: Int)
}

extension Browse{
    
    var baseURL: URL{
        return URL(string: "https://api.spotify.com/v1/browse/")!
    }
    
    var path: String{
        switch self {
        case .new_releases:
            return "new-releases"
        }
    }
    
    var method: HTTPMethod{
        switch self {
        case .new_releases:
            return .get
        }
    }
    
    var parameters: Parameters?{
        switch self {
        case .new_releases(let offset):
            return ["offset": offset]
        }
    }
    
    var headers: HTTPHeaders?{
        switch self {
        case .new_releases:
            return ["Authorization": "Bearer \(AppData.token ?? "")"]
        }
    }
    
    var task: Task{
        switch self {
        case .new_releases:
            return .requestParameters
        }
    }
    
    var parametersEncoding: ParametersEncoding?{
        switch self {
        case .new_releases:
            return .url
        }
    }
    
}
