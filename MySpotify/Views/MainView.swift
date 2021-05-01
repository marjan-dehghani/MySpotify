//
//  ContentView.swift
//  MySpotify
//
//  Created by Marjan on 2/9/1400 AP.
//

import SwiftUI

struct MainView: View {
    
    @StateObject private var browseVM = BrowseViewModel()
    
    init() {
        UINavigationBar.appearance().tintColor = UIColor(ColorReference.pink.color)
        UINavigationBar.appearance().backgroundColor = .clear
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    var body: some View {
        
        NavigationView{
            
            ZStack {
                
                Color.black.ignoresSafeArea()
                

                ScrollView{

                
                if browseVM.isFetchingData{
                    
                    CircleLoader()
                    
                }else{
                                            
                        LazyVStack{
                            
                            ForEach(browseVM.albums, id: \.id){ album in
                                
                                NavigationLink(
                                    destination: AlbumDetailsView(album: album),
                                    label: {
                                        ListItemView(album: album)
                                    }).onAppear {
                                        
                                        guard let currentId = album.id, let lastId = browseVM.albums.last?.id else { return }
                                        
                                        if currentId == lastId{
                                            
                                            browseVM.userReachedToEndOfList()
                                            
                                        }
                                        
                                    }
                                
                            }
                            
                        }
                        
                    }
                                        
                }
                
                
            }.navigationBarTitle("Spotify Recent Release", displayMode: .large)
            .navigationBarHidden(false)
            
        }
        
    }
}
