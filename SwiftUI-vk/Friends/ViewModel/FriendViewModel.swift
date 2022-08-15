//
//  FriendViewModel.swift
//  SwiftUI-vk
//
//  Created by Алексей Логинов on 10.08.2022.
//

import Foundation

final class FriendViewModel {
    private var friends: [FriendModel] = []
    
    init() {
        createFriends()
    }
    
//MARK: - Methods
    func getFriend(index: Int) -> FriendModel {
        friends[index]
    }
    
    func getFriends() -> [FriendModel] {
        friends
    }
    
//MARK: - Private Methods
    private func createFriends() {
        let friend = FriendModel(secondName: "Леонардо", firstName: "Ди Каприо", isOnline: true, avatarImage: "leonardo", photos: [""])
        let friendTwo = FriendModel(secondName: "Сандра", firstName: "Баллок", isOnline: true, avatarImage: "sandrabullock", photos: [""])
        let friendThree = FriendModel(secondName: "Робер", firstName: "Дауни младший", isOnline: false,avatarImage: "robertdauni", photos: [""])
        let friendsFour = FriendModel(secondName: "Анжелина", firstName: "Джоули", isOnline: false, avatarImage: "AnDgoli", photos: [""])
        
        friends.append(friend)
        friends.append(friendTwo)
        friends.append(friendThree)
        friends.append(friendsFour)
    }
}
