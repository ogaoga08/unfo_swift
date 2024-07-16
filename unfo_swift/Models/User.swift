//
//  User.swift
//  MyFirstXcode
//
//  Created by 小笠原慎 on 2024/07/14.
//

import Foundation

struct User: Decodable {
    let id: String
    let name: String
    let image: String
    
    var isCurrentUser:Bool {
        return self.id == User.currentUser.id
        //ブロック内の処理が１行ですむ場合はreturnはいらない
    }
    //計算プロパティはvarで定義する
    static var currentUser: User {
        User(id: "1", name: "おが", image: "User01")
    }
}
