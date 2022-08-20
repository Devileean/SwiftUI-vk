//
//  GroupsView.swift
//  SwiftUI-vk
//
//  Created by Алексей Логинов on 11.08.2022.
//

import SwiftUI

struct GroupsView: View {
    var body: some View {
        NavigationView{
            
                List{
                    ScrollView{
                VStack{
                    Text("20 Century Fox Studio")
                        .font(.largeTitle)
                        .padding(.bottom, 0.0)
                        
                    Text("20.11.1967")
                        
                    GroupPresentationImageView{
                        Image("20fox")
                            
                            
                            
                    }
                }
    }
        }
        }
    }
}
struct GroupsView_Previews: PreviewProvider {
    static var previews: some View {
        GroupsView()
    }
}
