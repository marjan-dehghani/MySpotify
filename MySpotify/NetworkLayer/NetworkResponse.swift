//
//  NetworkResponse.swift
//  MySpotify
//
//  Created by Marjan on 2/10/1400 AP.
//

import Foundation

struct Response<T> {
    let value: T?
    let error: NetworkError?
}

enum NetworkError: Error {
    case decodingError
    case httpError(Int)
    case unknown
}
