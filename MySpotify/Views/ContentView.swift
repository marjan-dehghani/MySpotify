//
//  ContentView.swift
//  MySpotify
//
//  Created by Marjan on 2/9/1400 AP.
//

import SwiftUI

struct MainView: View {
    
    @StateObject private var browseVM = BrowseViewModel()
    
    var body: some View {
        
        NavigationView{
            
            ZStack{
                
                Color.black.ignoresSafeArea()
                
                List((browseVM.browseData?.albums?.items) ?? []){ album in
                    
                    Text(album.name ?? "no name")
                    
                }.background(Color.black)
                
            }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
