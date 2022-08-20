//
//  AvatarImageView.swift
//  SwiftUI-vk
//
//  Created by Алексей Логинов on 14.08.2022.
//

import SwiftUI

struct AvatarImage: View {
    var content: Image
    
    init(@ViewBuilder content: () -> Image) {
        self.content = content()
    }
    
    var body: some View {
        content
            .resizable()
            .frame(width: 50, height: 50.0)
            .clipShape(Circle())
            .overlay{Circle().stroke(.white, lineWidth: 3)
                
                
                //.padding()
            }
            .modifier(CircleShadow(shadowColor: .white, shadowRadius: 4, shadowOpacity: 0.7))
            .shadow(radius: 10)
    }
}
