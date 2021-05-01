//
//  BrowseViewModel.swift
//  MySpotify
//
//  Created by Marjan on 2/10/1400 AP.
//

import Foundation
import Combine

protocol BrowseViewModelProtocol {
    func userReachedToEndOfList()
    func getNewReleases()
    var getNewReleasesFailed: Bool { get set }
    var browseData: BrowseData? { get set }
    var albums: [Album] { get set }
}

class BrowseViewModel: BrowseViewModelProtocol, ObservableObject {
    
    private var cancellables = Set<AnyCancellable>()
    
    @Published var isFetchingData: Bool = false
    @Published var getNewReleasesFailed: Bool = false
    var browseData: BrowseData?
    @Published var albums: [Album] = []
    
    init() {
        
        let tokenExpirationExists = AppData.token_expiration != nil
        
        let tokenHasExpired = tokenExpirationExists && Date.isExpired(secondsSince1970: AppData.token_expiration ?? 0)
        
        isFetchingData = true
        
        if AppData.token.isNilOrEmpty || tokenHasExpired{
            
            AuthViewModel.shared.refreshAccessToken(then: getNewReleases)
            
        }else{
            
            self.getNewReleases()
            
        }

    }
    
    func getNewReleases(){

        let publisher: AnyPublisher<Response<BrowseData>,Error> = APIAgent.run(Browse.new_releases(offset: albums.count))

        publisher.sink { (_) in
            
        } receiveValue: { [weak self] (response) in
            
            if let browseData = response.value{
                
                self?.browseData = browseData
                self?.albums.append(contentsOf: browseData.albums?.items ?? [])
                
            }else{
                
                self?.getNewReleasesFailed = true
                
            }
            
            self?.isFetchingData = false
            
        }.store(in: &cancellables)

    }
    
    func userReachedToEndOfList() {
        
        let thereAreMoreToFetch = (albums.count < browseData?.albums?.total ?? 0)
        
        if thereAreMoreToFetch{
            
            getNewReleases()
            
        }
        
    }
    
}
