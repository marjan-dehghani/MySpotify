//
//  URLComponents+Network.swift
//  MySpotify
//
//  Created by Marjan on 2/10/1400 AP.
//

import Foundation

extension URLComponents {

    init(endpoint: EndPoint) {
        
        let url = endpoint.baseURL.appendingPathComponent(endpoint.path)
        
        self.init(url: url, resolvingAgainstBaseURL: false)!
        
        guard case .requestParameters = endpoint.task, endpoint.parametersEncoding == .url, let parameters = endpoint.parameters else { return }
        
        queryItems = parameters.map { key, value in
            return URLQueryItem(name: key, value: String(describing: value))
        }
        
    }
    
}
