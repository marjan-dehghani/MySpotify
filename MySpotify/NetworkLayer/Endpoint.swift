//
//  Endpoint.swift
//  MySpotify
//
//  Created by Marjan on 2/9/1400 AP.
//

import Foundation

public typealias Parameters = [String: Any]
public typealias HTTPHeaders = [String: String]

enum HTTPMethod: String{
    case post = "POST"
    case get = "GET"
    case delete = "DELETE"
    case put = "PUT"
}

enum Task {
    case requestPlain
    case requestParameters
}

enum ParametersEncoding {
    case url
    case json
}

protocol EndPoint {
    
    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var parameters: Parameters? { get }
    var headers: HTTPHeaders? { get }
    var task: Task { get }
    var parametersEncoding: ParametersEncoding? { get }

}
