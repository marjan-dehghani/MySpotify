//
//  AuthViewModel.swift
//  MySpotify
//
//  Created by Marjan on 2/10/1400 AP.
//

import Foundation
import Combine

protocol AuthViewModelProtocol {
    func refreshAccessToken(then execute: @escaping ()->Void)
}

class AuthViewModel: AuthViewModelProtocol {
            
    private var cancellables = Set<AnyCancellable>()
    
    static let shared = AuthViewModel()
        
    func refreshAccessToken(then execute: @escaping ()->Void) {
        
        let publisher: AnyPublisher<Response<AuthData>,Error> = APIAgent.run(Auth.token)
        
        publisher.sink(receiveCompletion: { (_) in
            
        }, receiveValue: { (response) in
            
            if let authData = response.value{
                
                AppData.token = authData.access_token
                AppData.token_expiration = Date.currentSecondsSince1970 + (authData.expires_in ?? 0)
                    
                execute()
                
            }
            
        }).store(in: &cancellables)
    }
}
