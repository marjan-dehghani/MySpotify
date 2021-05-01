//
//  URLRequest+Network.swift
//  MySpotify
//
//  Created by Marjan on 2/10/1400 AP.
//

import Foundation

extension URLRequest {

    init(endpoint: EndPoint) {
        
        let urlComponents = URLComponents(endpoint: endpoint)
        
        self.init(url: urlComponents.url!)
        
        httpMethod = endpoint.method.rawValue
        
        endpoint.headers?.forEach { key, value in
            addValue(value, forHTTPHeaderField: key)
        }

        guard case .requestParameters = endpoint.task, endpoint.parametersEncoding == .json, let parameters = endpoint.parameters else { return }
        
        httpBody = try? JSONSerialization.data(withJSONObject: parameters)
    }
}
