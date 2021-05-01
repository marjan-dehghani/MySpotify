//
//  APIService.swift
//  MySpotify
//
//  Created by Marjan on 2/9/1400 AP.
//

import Foundation
import Combine

struct APIAgent {
    
    static func run<T: Codable>(_ endPoint: EndPoint) -> AnyPublisher<Response<T>, Error> {
                
        let request = URLRequest(endpoint: endPoint)
                
        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { result -> Response<T> in
                return APIAgent.processDataResponse(result)
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    static func processDataResponse<T: Codable>(_ output: URLSession.DataTaskPublisher.Output) -> Response<T>{
        
        guard let httpResponse = output.response as? HTTPURLResponse else {
            return Response(value: nil, error: .unknown)
        }
        
        switch httpResponse.statusCode {
        case 200...299:
            guard let model = try? JSONDecoder().decode(T.self, from: output.data) else {
                return Response(value: nil, error: .decodingError)
            }
            return Response(value: model, error: nil)
        default:
            return Response(value: nil, error: .httpError(httpResponse.statusCode))
        }
        
    }
    
}
