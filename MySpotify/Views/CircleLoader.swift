//
//  SwiftUIView.swift
//  MySpotify
//
//  Created by Marjan on 2/11/1400 AP.
//

import SwiftUI

struct CircleLoader: View {
    
    @State private var isLoading = false

    var body: some View {
        
        ZStack {
            
            Circle()
                .frame(width: 40, height: 40)
                .background(Color.clear)

            Circle()
                .trim(from: 0, to: 0.2)
                .stroke(ColorReference.pink.color, lineWidth: 6)
                .shadow(color: ColorReference.pink.color.opacity(0.7), radius: 10, x: 0.0, y: 0.0)
                .frame(width: 40, height: 40)
                .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
                .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
                .onAppear() {
                        self.isLoading = true
                }.padding(.all, 6)
        }
    }
}

struct CircleLoader_Previews: PreviewProvider {
    static var previews: some View {
        CircleLoader()
    }
}
