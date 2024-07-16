//
//  ChatViewModel.swift
//  MyFirstXcode
//
//  Created by 小笠原慎 on 2024/07/14.
//

import Foundation

class ChatViewModel: ObservableObject {
    
    @Published var chatData:[Chat] = []
    //↑このプロパティには、このfetchChatDataメソッドでJSONデータから変換処理されたChat型のインスタンスを値に持つ
    
    init() {
        chatData = fetchChatData()
    }
 
    private func fetchChatData() -> [Chat] {
        let fileName = "chatData.json"
        let data: Data
        
        guard let filePath = Bundle.main.url(forResource:fileName, withExtension: nil) else {
            fatalError("\(fileName)が見つかりませんでした")
        }
        
        do {
            data = try Data(contentsOf: filePath)
        } catch {
            fatalError("\(fileName)のロードに失敗しました")
        }
        
        do {
            return try JSONDecoder().decode([Chat].self, from:data)
        } catch {
            fatalError("\(fileName)を\(Chat.self)に変換することに失敗しました")
        }
        
    }
    
    func addMessage(chatId:String, text: String) {
        
        guard let index = chatData.firstIndex(where: { chat in
            //firstIndexメソッドは、配列の要素の中で特定の条件がtrueになる場合の要素のインデックスを返すメソッドです。
            chat.id == chatId
            //各要素のidプロパティの値と引数で取得したchatIdの値を比較して、その結果がtrueになった場合、その要素のインデックスがこの定数indexに代入されます。
        }) else {return}
        //このindexを使って、対象となる配列の要素のインスタンスを特定することができるようになりました。
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let formattedDateString = formatter.string(from: Date())
        
        let newMessage = Message(
            id: UUID().uuidString,
            text: text,
            user: User.currentUser,
            date: formattedDateString,
            readed: false
        )
        
        chatData[index].messages.append(newMessage)
        //messagesプロパティで新しいメッセージを追加している
    }
    
    func getTitle(messages: [Message]) -> String {
        var title = ""
        let names = getMembers(messages: messages, type: .name)
        //この定数namesには、getMembersメソッドから返されたユーザー名の値が配列で格納されています
        
        for name in names {
            title += title.isEmpty ? "\(name)" : ", \(name)"
        }
        
        return title
    }
    
    func getImages(messages:[Message]) -> [String] { getMembers(messages: messages, type: .image) }
        //第1引数には、このメソッドの引数として渡されるmessagesの値を直接渡して、第2引数のtypeには今度はアイコン画像の名前が必要になるので、列挙型ValueTypeの要素の中からimageを指定します。
        // return getMembers(messages: messages, type: .image)
        // return1行で返す場合はreturnいらない
    
    private func getMembers(messages:[Message], type: ValueType) -> [String] {
        var members: [String] = []
        //値を格納する変数
        var userIds: [String] = []
        //配列の場合は要素のデータ型が不明なので、データ型を指定する必要がある
        
        for message in messages {
            let id = message.user.id
            
            if id == User.currentUser.id {continue}
            if userIds.contains(id) {continue}
            //containsメソッドを使って、このメソッドの引数に設定した値が対象の配列の要素に存在しているかどうかを判定しまsiu
            //このif文の条件がtrueになった場合、つまりユーザーのidがすでに配列の中に存在していた場合、
            //以下の処理は実行されない
            
            userIds.append(id)
            
            switch type {
            case .name:
                members.append(message.user.name)
            case .image:
                members.append(message.user.image)
            }
        }
        return members
    }
}

//getMembersメソッドを呼び出す際に列挙型ValueTypeの識別子を設定して、呼び出し元で必要となる値を指定することができます。
enum ValueType {
    case name
    case image
}
