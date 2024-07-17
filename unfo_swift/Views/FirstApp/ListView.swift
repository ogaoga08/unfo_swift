//
//  ListView.swift
//  MyFirstXcode
//
//  Created by 小笠原慎 on 2024/07/15.
//

import SwiftUI

struct ListView: View {
    @ObservedObject var vm: ChatViewModel = ChatViewModel()
    //ChatViewModelクラスのプロパティにアクセスできる
    var body: some View {
        NavigationView {
            VStack {
                //ヘッダー
                header
                //リスト
                list
            }
            .padding(.horizontal)
        }
        
    }
}

#Preview {
    ListView()
}

extension ListView {
    private var header: some View {
        HStack {
            Text("トーク")
                .font(.title2.bold())
            Spacer()
            HStack(spacing:16) {
                Image(systemName: "text.badge.checkmark")
                Image(systemName: "square")
                Image(systemName: "ellipsis.bubble")
            }
            .font(.title2)
        }
    }
    
    private var list: some View {
        ScrollView {
            VStack {
                ForEach(vm.chatData) { chat in
                    //このクロージャーのブロックの中で一つ一つのチャットデータを取得することができます。
                    //これをSwiftUIView(ChatView)に渡すことで任意のトーク画面にいける
                    NavigationLink {
                        SwiftUIView(chat: chat)
                        //このchatは上の引数を使うことで値を渡している
                            .environmentObject(vm)
                            .toolbar(.hidden)
                    } label: {
                        listRow(chat:chat)
                    }
                }
            }
        }
    }
    
    //    private var listRow: some View {
    //        プロパティの形(var)からメソッド(func)にして引数を渡せるようにする
    private func listRow(chat: Chat) -> some View {

        HStack {
            
            let images = vm.getImages(messages: chat.messages)
            //定数imagesにユーザーのアイコン画像の名前がString型で配列の中に格納されます。
            HStack(spacing: -28) {
                ForEach(images, id: \.self) {image in
                    // 第2引数のidには、要素のインスタンスそのものを.selfというキーワードで渡します。
                    //バックスラッシュですが、これはキープパスという仕組みで、ForEachの第2引数に値を渡す場合にはキープパスが必要🌾
                    Image(image)
                        .resizable()
                        .frame(width:48, height: 48)
                        .clipShape(Circle())
                        .background(
                            Circle()
                                .foregroundColor(Color(uiColor: .systemBackground))
                                .frame(width: 54, height: 54)
                        )
                }
            }
            
            VStack(alignment: .leading) {
                Text(vm.getTitle(messages: chat.messages))
                    .lineLimit(1)
                    .foregroundColor(.primary)
                Text(chat.recentMessageText)
                //chat型のデータモデルの中に新しいプロパティを定義して、最新のメッセージとしてここに渡す
                    .font(.footnote)
                    .lineLimit(1)
                    .foregroundColor(Color(uiColor: .secondaryLabel))
            }
            Spacer()
            Text(chat.recentMessageDateString)
                .font(.caption)
                .foregroundColor(Color(uiColor: .secondaryLabel))
        }
    }
}
