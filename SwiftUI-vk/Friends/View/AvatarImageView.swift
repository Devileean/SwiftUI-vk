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
            .frame(width: 60, height: 60)
            .clipShape(Circle())
            .overlay{Circle().stroke(.white, lineWidth: 4)
            //.modifier(CircleShadow(shadowColor: .black, shadowRadius: 4, shadowOpacity: 0.7))
                    .shadow(radius: 7)
                    
            //.padding()
    }
}
}
