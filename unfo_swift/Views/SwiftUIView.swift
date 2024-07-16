//
//  SwiftUIView.swift
//  MyFirstXcode
//
//  Created by 小笠原慎 on 2024/07/12.
//

import SwiftUI

struct SwiftUIView: View {
    
    let chat: Chat
    
    @State private var textField: String = ""
    @FocusState private var textFieldFocused: Bool
    @Environment(\.dismiss) private var dismiss
    //画面を閉じるためのハンドラー
    
    @EnvironmentObject var vm:ChatViewModel
    //@ObservedObject var vm:ChatViewModel = ChatViewModel()
    //@とは→プロパティラッパー
    
    var body: some View {
        VStack(spacing:0){
            //メッセージエリア
            messageArea
            //ナビゲーションエリア
            .overlay(navigationArea, alignment: .top)
            //インプットエリア
            inputArea
        }
        
    }
}

//#Preview {
//    SwiftUIView()
//}
//プレビュー画面を表示させる

extension SwiftUIView {
    private var messageArea: some View{
        ScrollViewReader { proxy in
            //メッセージエリア
            ScrollView{
                VStack(spacing:0){
                    ForEach(chat.messages) { message in
                        MessageRow(message: message)
                    }
                }
                .padding(.horizontal)
                .padding(.top, 72)
            }
            .background(Color("Background"))
            .onTapGesture {
                textFieldFocused = false
            }
            .onAppear {
                scrollToLast(proxy: proxy)
            }
            .onChange(of: chat.messages) {
                scrollToLast(proxy: proxy, anime: true)
            }
            .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardDidShowNotification)) { _ in
                scrollToLast(proxy: proxy, anime: true)
            }
        }
    }
    private var inputArea: some View {
        //インプットエリア
        HStack{
            HStack{
                Image(systemName: "plus")
                Image(systemName: "camera")
                Image(systemName: "photo")
            }
            .font(.title2)
            TextField("テキストを入力", text: $textField)
                .padding()
                .background(Color(uiColor: .secondarySystemBackground))
                .clipShape(Capsule())
                .overlay(
                    Image(systemName: "face.smiling")
                        .font(.title2)
                        .padding(.trailing)
                        .foregroundColor(.gray)
                    ,alignment: .trailing
                )
                .onSubmit {
                    sendMessage()
                }
                .focused($textFieldFocused)
            Image(systemName: "mic")
                .font(.title2)
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
        .background(Color(uiColor: .systemBackground))
    }
    private var navigationArea: some View{
        //ナビゲーションバー
        HStack{
            Button {
                dismiss()
            } label: {
                Image(systemName: "chevron.backward")
                    .font(.title2)
                    .foregroundColor(.primary)
            }

           
            Text("Title")
                .font(.title2.bold())
            Spacer()
            HStack(spacing:16){
                Image(systemName:"text.magnifyingglass")
                Image(systemName:"phone")
                Image(systemName:"line.3.horizontal")
            }
            .font(.title2)
        }
        .padding()
        .background(Color("Background").opacity(0.9))
    }
    
    private func sendMessage() {
        //空ではない場合のみ中の処理が実行される
        if !textField.isEmpty {
            vm.addMessage(chatId: chat.id, text: textField)
            textField = ""
        }
    }
    private func scrollToLast(proxy:ScrollViewProxy, anime: Bool = false) {
        if let lastMessage = chat.messages.last {
            if anime {
                withAnimation(.easeIn(duration: 0.1)) {
                    proxy.scrollTo(lastMessage.id, anchor:.bottom)
                }
            } else {
                proxy.scrollTo(lastMessage.id, anchor:.bottom)
            }
        }
    }
}
