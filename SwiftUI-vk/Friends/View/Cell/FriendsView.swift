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
                ScrollView{
                    HStack{
                        AvatarImage{
                            Image("leonardo")
                                
                            
                        }
                        .padding(/*@START_MENU_TOKEN@*/.all, 3.0/*@END_MENU_TOKEN@*/)
                        
                        VStack(alignment: .leading){
                            Text("Leonardo Di Kaprio")
                            
                                .navigationBarTitle("Friends", displayMode: .large)
                            //Spacer()
                                .padding(.leading)
                            Text("Online")
                                .font(.footnote)
                                .foregroundColor(Color(hue: 0.379, saturation: 0.842, brightness: 0.901))
                                .fontWeight(.thin)
                                .padding(.leading)
                            
                        }
                    }
                }
                .listRowBackground(Color(red: 0.308, green: 0.482, blue: 0.745))
                //.cornerRadius(18)
                
            }
            
            
        }
        // .padding(.bottom)
        
    }
}
struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView()
    }
}
