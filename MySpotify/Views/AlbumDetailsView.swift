//
//  AlbumDetailsView.swift
//  MySpotify
//
//  Created by Marjan on 2/10/1400 AP.
//

import SwiftUI
import Kingfisher

struct AlbumDetailsView: View {
    
    let album: Album
    
    var body: some View {
        
        ZStack{
            
            Color.black.ignoresSafeArea()
            
            ScrollView{
                
                VStack(alignment: .leading, spacing: 12){
                    
                    ZStack(alignment: .bottomLeading) {
                        
                        let imageURL = (album.images ?? []).isEmpty ? "" : album.images!.first(where: { (image) -> Bool in
                            !image.url.isNilOrEmpty
                        })?.url ?? ""
                        
                        KFImage
                            .url(URL(string: imageURL))
                            .resizable()
                            .aspectRatio(1, contentMode: .fill)
                        
                        HStack{
                            
                            HStack{
                                
                                ImageReference.calendar.image
                                    .resizable()
                                    .frame(width: 20, height: 20, alignment: .center)
                                
                                Text(album.release_date ?? "Unknown Release Date")
                                    .foregroundColor(ColorReference.green.color)
                                
                            }
                            .padding(.horizontal, 12)
                            .padding(.vertical, 8)
                            .background(Color.black.opacity(0.6))
                            .cornerRadius(5)
                            .padding(.all, 12)
                            
                            Spacer()
                            
                        }
                        
                    }
                    .aspectRatio(1, contentMode: .fit)
                    .clipped()
                    
                    
                    HStack{
                        
                        VStack(alignment: .leading, spacing: 8){
                            
                            Text(album.name ?? "")
                                .foregroundColor(ColorReference.lightPink.color)
                                .fontWeight(.bold)
                                .font(.system(size: 24))
                                .lineLimit(2)
                            
                            ForEach(album.artists ?? []) { (item) in
                                Text(item.name ?? "")
                                    .foregroundColor(ColorReference.grey.color)
                                    .fontWeight(.medium)
                            }
                            
                        }
                        
                        Spacer()
                        
                        
                        ImageReference.spotifyCircle.image
                            .resizable()
                            .frame(width: 58, height: 58)
                        
                    }
                    .padding(.horizontal, 16)
                    
                    Text(Constants.Spotify.INTRO)
                        .fontWeight(.regular)
                        .foregroundColor(ColorReference.grey.color)
                        .multilineTextAlignment(.leading)
                        .padding([.leading, .trailing], 16)
                    
                    Spacer()
                    
                    Button(action: {
                        
                        if let external = album.external_urls, let path = external.spotify, let url = URL(string: path) {
                            UIApplication.shared.open(url)
                        }
                        
                    }) {
                        
                        Text("Open in Spotify")
                            .foregroundColor(.white)
                        
                    }
                    
                    .frame( height: 56 )
                    .frame(maxWidth: .infinity, alignment: .center)
                    .background(ColorReference.pink.color)
                    .cornerRadius(12)
                    .shadow(color: ColorReference.pink.color.opacity(0.7), radius: 10, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                    .padding([.leading, .trailing], 16)
                    
                    
                }
                .edgesIgnoringSafeArea(.top)
                
                
            }
            
        }
        .edgesIgnoringSafeArea(.top)
        
    }
}
