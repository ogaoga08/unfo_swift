//
//  Chat.swift
//  MyFirstXcode
//
//  Created by 小笠原慎 on 2024/07/14.
//

import Foundation

struct Chat: Decodable, Identifiable {
    //↑Identifiableプロトコルはfor each文のコンパイルエラーを解消する
    let id:String
    var messages:[Message]
    //このChatタイプには、複数のメッセージのデータを格納しているmessagesプロパティがあります。
    //そして、そのデータ型はMessage型のインスタンスを要素に持つ配列になります。
    
    var recentMessageText: String {
        guard let recentMessage = self.messages.last else {return ""}
        //Chat型のインスタンス自身を参照していることを明示するためにselfキーワードを付けました。
        //lastプロパティは配列の最後の値を取得する
        //lastはオプショナル型なので、guard let 文でアンラップします。(nilの場合、空を返す)
        return recentMessage.text
        //return区で配列の最後の要素、つまり最新のメッセージのtextプロパティの値を返すようにします。
    }
    
    var recentMessageDateString: String {
        guard let recentMessage = self.messages.last else {return ""}
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        guard let date = formatter.date(from: recentMessage.date) else {return ""}
        formatter.dateFormat = "MM/dd"
        return formatter.string(from:date)
        
        
    }
}
