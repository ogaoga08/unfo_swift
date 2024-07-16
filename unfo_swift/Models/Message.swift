//
//  Message.swift
//  MyFirstXcode
//
//  Created by 小笠原慎 on 2024/07/14.
//

import Foundation

struct Message:Decodable, Identifiable, Equatable {
    static func == (lhs: Message, rhs: Message) -> Bool {
        return lhs.id == rhs.id
    }
    //このMessage型をEquatableプロトコルに準拠した比較可能な型にすることができました。
    
    let id:String
    let text: String
    let user: User
    let date: String
    let readed: Bool
}
