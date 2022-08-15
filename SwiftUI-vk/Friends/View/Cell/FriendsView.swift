//
//  FriendsView.swift
//  SwiftUI-vk
//
//  Created by Алексей Логинов on 10.08.2022.
//

import SwiftUI

struct FriendsView: View {
    var body: some View {
        NavigationView {
            List{
            HStack{
                AvatarImage{
                Image("leonardo")
        
                }
                VStack(alignment: .leading){
                    Text("Leonardo Di Kaprio")
                .navigationBarTitle("Friends", displayMode: .inline)
                    //Spacer()
                .padding()
                Text("Online")
                        .font(.footnote)
                        .foregroundColor(.green)
                        .fontWeight(.thin)
                        .padding(.top)
                   
            }
               
            }
            } .listRowBackground(Color(red: 0.308, green: 0.482, blue: 0.745))
    }
}
}
struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView()
    }
}
