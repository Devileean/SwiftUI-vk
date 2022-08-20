//
//  GroupPresentationImageView.swift
//  SwiftUI-vk
//
//  Created by Алексей Логинов on 20.08.2022.
//

import SwiftUI

struct GroupPresentationImageView: View {
    var content: Image
    
    init(@ViewBuilder content: () -> Image) {
        self.content = content()
    }
    
    var body: some View {
        content
            .resizable()
            .frame(width: 240, height: 210)
            .clipShape(Rectangle())
            .overlay{Rectangle().stroke(.yellow, lineWidth: 3)
            }
    }
}


