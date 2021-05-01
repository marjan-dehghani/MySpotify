//
//  ListItemView.swift
//  MySpotify
//
//  Created by Marjan on 2/10/1400 AP.
//

import SwiftUI
import Kingfisher

struct ListItemView: View {
    
    let album: Album
    
    var body: some View {
        
        HStack(spacing: 12){
            
            let imageURL = (album.images ?? []).isEmpty ? "" : album.images!.first(where: { (image) -> Bool in
                !image.url.isNilOrEmpty
            })?.url ?? ""
            
            KFImage
                .url(URL(string: imageURL))
                .resizable()
                .frame(minWidth: 0, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: 100, minHeight: 0, idealHeight: 100, maxHeight: 100)
                .background(Color.clear)
                .cornerRadius(8.0)
 
            VStack(alignment: .leading){
                
                let artistsName = (album.artists ?? []).isEmpty ? "Unknown Artist" : (album.artists?[0].name ?? "Unknown artist")
                
                Text(album.name ?? "No Name")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .font(.system(size: 20))
                    .lineLimit(2)
                
                Text(artistsName)
                    .foregroundColor(ColorReference.lightPink.color)
                    .fontWeight(.semibold)
                    .font(.system(size: 18))
                    .lineLimit(1)
                
                Spacer()
                
                HStack{
                    
                    HStack(spacing: 4){
                        ImageReference.musicalNote.image.fixedSize()
                        Text(album.album_type ?? "")
                            .fontWeight(.medium)
                            .foregroundColor(ColorReference.lightPink.color)
                    }
                    
                    Spacer()
                    
                    if album.typeEnum == .album{
                        
                        HStack(spacing: 4){
                            Text((album.total_tracks ?? 0).description)
                                .frame(minWidth: 0, idealWidth: 28, maxWidth: 28, minHeight: 0, idealHeight: 28, maxHeight: 28)
                                .background(ColorReference.pink.color)
                                .foregroundColor(.white)
                                .cornerRadius(14.0)
                            Text((album.total_tracks ?? 0) == 1 ? "Track" : "Tracks")
                                .foregroundColor(ColorReference.pink.color)
                                .fontWeight(.light)
                        }
                        
                    }
                                        
                }
            }
            
        }.padding(.all, 16)
        
    }
}
