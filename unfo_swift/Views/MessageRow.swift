//
//  MessageRow.swift
//  MyFirstXcode
//
//  Created by 小笠原慎 on 2024/07/12.
//

import SwiftUI

struct MessageRow: View {
    
    let message: Message
    
    var body: some View {
        HStack(alignment:.top){
            if message.user.isCurrentUser {
                //trueの場合
                Spacer()
                messageState
                messageText
                
            } else {
                //falseの場合
                userThamb
                messageText
                messageState
                Spacer()
            }
        }
        .padding(.bottom)
    }
}

//#Preview {
//    MessageRow()
//        .background(.cyan)
//        //↑はプレビューのみ適用
//}


extension MessageRow{
    
    private var userThamb: some View {
        Image(message.user.image)
            .resizable()
            .frame(width:48, height:48)
            .clipShape(Circle())
    }
    
    private var messageText: some View {
        Text(message.text)
            .padding()
            .background(message.user.isCurrentUser ? Color("Bubble"): Color(uiColor: .tertiarySystemBackground))
            .foregroundColor(message.user.isCurrentUser ? .black: .primary)
        //三項演算子
            .cornerRadius(30)
    }
    
    private var messageState: some View {
        VStack(alignment:.trailing){
            Spacer()
            if message.user.isCurrentUser && message.readed {
                Text("既読")
            }
            Text(formattedDaraString)
        }
        .foregroundColor(.secondary)
        .font(.footnote)
    }
    
    //現在時刻の値を格納するプロパティ
    private var formattedDaraString:String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        guard let date = formatter.date(from: message.date) else {return ""}
        formatter.dateFormat = "HH:mm"
        return formatter.string(from:date)
    }
}
